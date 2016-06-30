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

	(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) = ddlib.from_bazaar(_row)

	offsets = {}
	coffset = 0
	for start in range(0, len(words)):
		offsets[start] = coffset 
		coffset = coffset + 1 + len(words[start])

	history = {}
	for start in range(0, len(words)):
		for end in reversed(range(start + 1, min(len(words), start + 1 + MAXPHRASELEN))):
									
			if start in history or end in history: continue
					
			phrase = " ".join(words[start:end])

			if phrase.lower() in dict_intervals:
			
				eid = "TIME_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
				prov = json.dumps([sentid, "%d"%start, "%d"%(end-1), phrase])
				#prov = "ext_temporal_local.py:1"
				
				#prov = "|||||".join([sentid, "%d"%offsets[start], "%d"%offsets[(end-1)], phrase])
				name = dict_intervals[phrase.lower()]
				
				print "\t".join([docid, "INTERVAL", eid, name, prov])
				#print json.dumps({"docid":docid, "type":"INTERVAL", "eid":eid, "entity": name, "prov":prov, "is_correct":None})

				#ddlib.log(name)

				for i in range(start, end):
					history[i]=1

			if '-' in phrase:
				i = -1
				for part in phrase.split('-'):
					i = i + 1
					if part.lower() in dict_intervals:

						eid = "TIME_DOC_" + docid + "_%s_%d_%d_PART_%d" % (sentid, start, end-1, i)
						prov = json.dumps([sentid, "%d"%offsets[start], "%d"%offsets[(end-1)], part])
						#prov = "ext_temporal_local.py:2"
						
						#prov = "|||||".join([sentid, "%d"%offsets[start], "%d"%offsets[(end-1)], part])
						name = dict_intervals[part.lower()]
						
						print "\t".join([docid, "INTERVAL", eid, name, prov])
						#print json.dumps({"docid":docid, "type":"INTERVAL", "eid":eid, "entity": name, "prov":prov, "is_correct":None})

						#ddlib.log(name)

						for i in range(start, end):
							history[i]=1





