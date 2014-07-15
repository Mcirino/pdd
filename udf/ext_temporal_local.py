#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json

dict_intervals = {}
for l in open(ddlib.BASE_FOLDER + '/dicts/intervals.tsv', 'r'):
	(begin, end, name) = l.rstrip().split('\t')
	if name.startswith('Cryptic'): continue
	dict_intervals[name.lower()] = name + '|' + begin + '|' + end
	va = name.lower().replace('late ', 'upper ').replace('early ', 'lower')
	if va != name.lower():
		dict_intervals[va] = name + '|' + begin + '|' + end	

MAXPHRASELEN = 3

for _row in sys.stdin:
	row = json.loads(_row)
	docid = row["docid"]
	sentid = row["sentid"]
	wordidxs = row["wordidxs"]
	words = row["words"]
	poses = row["poses"]
	ners = row["ners"]
	lemmas = row["lemmas"]
	dep_paths = row["dep_paths"]
	dep_parents = row["dep_parents"]
	bounding_boxes = row["bounding_boxes"]

	history = {}
	for start in range(0, len(words)):
		for end in reversed(range(start + 1, min(len(words), start + 1 + MAXPHRASELEN))):
									
			if start in history or end in history: continue
					
			phrase = " ".join(words[start:end])

			if phrase.lower() in dict_intervals:
			
				eid = "TIME_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
				prov = [sentid, "%d"%start, "%d"%(end-1), phrase]
				name = dict_intervals[phrase.lower()]
				print json.dumps({"docid":docid, "type":"INTERVAL", "eid":eid, "entity": name, "prov":prov})

				#ddlib.log(name)

				for i in range(start, end):
					history[i]=1

			if '-' in phrase:
				i = -1
				for part in phrase.split('-'):
					i = i + 1
					if part.lower() in dict_intervals:

						eid = "TIME_DOC_" + docid + "_%s_%d_%d_PART_%d" % (sentid, start, end-1, i)
						prov = [sentid, "%d"%start, "%d"%(end-1), part]
						name = dict_intervals[part.lower()]
						print json.dumps({"docid":docid, "type":"INTERVAL", "eid":eid, "entity": name, "prov":prov})

						#ddlib.log(name)

						for i in range(start, end):
							history[i]=1





