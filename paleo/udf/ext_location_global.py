#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json
import os
import string
import math

locs = {}
pars = {}
ranks = {}
id2ents = {}
id2pop = {}
progress = 0

BADLOCATIONNAME = {	"north":1,	"south":1,	"east":1,	"west":1,	"north":1,	"central":1,
	"hill":1,	"hills":1,	"lake":1,	"mount":1,	"springs":1,	"white":1,	"basin":1,
	"pushkin":1,	"lima":1,	"island":1,	"ocean":1,	"southwest":1,	"southeast":1,
	"northwest":1,	"northeast":1,	"valley":1,	"academia":1,	"national":1,
	"museum":1,	"cross":1,	"united":1,	"reservoir":1,	"limestone":1,	"creek":1,
	"middle":1	  
}

words = {}
pprev = ""
prev = ""

import zipfile
import os

for _file in os.listdir(ddlib.BASE_FOLDER + '/dicts'):
	if not _file.startswith('geonames'): continue
	for l in open(ddlib.BASE_FOLDER + '/dicts/' + _file):
		if progress % 100000 == 0:
			ddlib.log(progress)
			#break
		progress = progress + 1
		(id, ent, rank, names, parents) = l.rstrip('\n').split('\t')
		rank = rank
		names = names.split(',')
		parents = parents.split(',')

		names.append(ent.split('|')[0])

		added = False
		for name in names:
			name = name.lower()

			if name not in locs: locs[name] = {}
			locs[name][id] = "1"
			added = True
			
		if added == True:
			id2pop[id] = len(names)
			for p in parents:
				pars[id + "|" + p] = "1"

			id2ents[id] = ent

			ranks[id] = rank
	break

MAXPHRASELEN = 3

for _row in sys.stdin:

	try:
		(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts) = _row.split('\t')
	except:
		ddlib.log(_row)
		continue

	obvious_locs = {}
	candidates = {}

	started = False
	ended = False

	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) in \
		ddlib.from_bazaar_doc(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts):

		sentid = int(sentid)

		for start in range(0, len(words)):
			for end in range(start + 1, min(len(words) + 1, start + 1 + MAXPHRASELEN)):
				phrase = " ".join(words[start:end])
				ner = " ".join(ners[start:end])

				if not re.search('^[A-Z]', phrase): continue
				if not re.search('^(LOCATION\s*)+$', ner) and phrase.lower() not in ['iowa']: continue

				nearest_number = -1
				for i in range(end, len(words)):
					if re.search('^[0-9][0-9][0-9][0-9]$', words[i]):
						nearest_number = i
						break
				if nearest_number != -1 and (nearest_number - end) < 8: continue
				
				nearest_number = -1
				for i in range(end, len(words)):
					if re.search('^and$', words[i].lower()):
						nearest_number = i
						break
					if re.search('^et$', words[i].lower()):
						nearest_number = i
						break
				if nearest_number != -1 and (nearest_number - end) < 3: continue

				if phrase.lower() in locs and phrase.lower() not in BADLOCATIONNAME:
					if len(locs[phrase.lower()]) == 1:
						obvious_locs[phrase.lower()] = {locs[phrase.lower()].keys()[0]:{1:1}}			 
					if phrase.lower() not in candidates:
						candidates[phrase.lower()] = {}
					candidates[phrase.lower()][sentid] = [start, end]


	for phrase1 in candidates:
		for phrase2 in candidates:
			for s1 in candidates[phrase1]:
				if s1 in candidates[phrase2]:
					s2 = s1
					if s1 == s2 :
						dis = candidates[phrase2][s2][0] - candidates[phrase1][s1][1]

						if dis >= 0 and dis <= 5:
							for id1 in locs[phrase1]:
								for id2 in locs[phrase2]:
									if id1 + "|" + id2 in pars:
										if phrase1 not in obvious_locs: obvious_locs[phrase1] = {}
										if id1 not in obvious_locs[phrase1]: obvious_locs[phrase1][id1] = {}
										obvious_locs[phrase1][id1][2] = 1

	for phrase1 in candidates:
		if phrase1 not in obvious_locs:
			for id1 in locs[phrase1]:
				if ranks[id1] == "1":
					if phrase1 not in obvious_locs: obvious_locs[phrase1] = {}
					if id1 not in obvious_locs[phrase1]: obvious_locs[phrase1][id1] = {}
					obvious_locs[phrase1][id1][3] = 1

	for phrase1 in candidates:
		if phrase1 not in obvious_locs:
			for id1 in locs[phrase1]:
				if ranks[id1] == "2":
					if phrase1 not in obvious_locs: obvious_locs[phrase1] = {}
					if id1 not in obvious_locs[phrase1]: obvious_locs[phrase1][id1] = {}
					obvious_locs[phrase1][id1][4] = 1


	for phrase1 in candidates:
		for phrase2 in candidates:
			for s1 in candidates[phrase1]:
				if s1 in candidates[phrase2]:
					s2 = s1
					if s1 == s2:
						if math.fabs(s1 - s2) < 10000 :
							for id1 in locs[phrase1]:
								for id2 in locs[phrase2]:
									if id1 + "|" + id2 in pars:
										if phrase1 not in obvious_locs: obvious_locs[phrase1] = {}
										if id1 not in obvious_locs[phrase1]: obvious_locs[phrase1][id1] = {}
										obvious_locs[phrase1][id1][6] = 1

						if math.fabs(s1 - s2) < 5 :
							for id1 in locs[phrase1]:
								for id2 in locs[phrase2]:
									if id1 + "|" + id2 in pars:
										if phrase1 not in obvious_locs: obvious_locs[phrase1] = {}
										if id1 not in obvious_locs[phrase1]: obvious_locs[phrase1][id1] = {}
										obvious_locs[phrase1][id1][5] = 1

	locmapping = {}
	for phrase in obvious_locs:
		mpid = -1
		maxpop = -1
		for id in obvious_locs[phrase]:
			ll = len(obvious_locs[phrase][id])
			if ll > maxpop:
				maxpop = ll
				mpid = id
		locmapping[phrase] = mpid

	for phrase in obvious_locs:

		if phrase in locmapping:
			continue

		mpid = -1
		maxpop = -1
		for id in obvious_locs[phrase]:
			if id2pop[id] > maxpop:
				maxpop = id2pop[id]
				mpid = id

		locmapping[phrase] = mpid

	#title = doc.title.replace(',', ' ')
	#title = re.sub('\s+', ' ', title)
	#titlewords = title.lower().split(' ')
	#
	#for start in range(0, len(titlewords)):
	#	for end in reversed(range(start + 1, min(len(titlewords)+1, start + 1 + MAXPHRASELEN))):
	#		phrase = " ".join(titlewords[start:end])
	#
	#		if start in history: continue
	#
	#		if phrase.lower() in locmapping:
	#			doc.titleentities.append(Entity("LOCATION", id2ents[locmapping[phrase.lower()]] , []))
	#			for i in range(start, end):
	#				history[i] = 1

	badnames = {}
	started = False
	ended = False
	history = {}

	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) in \
		ddlib.from_bazaar_doc(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts):

		sentid = int(sentid)

		for start in range(0, len(words)):
			for end in reversed(range(start + 1, min(len(words)+1, start + 1 + MAXPHRASELEN))):

				if start in history: continue

				phrase = " ".join(words[start:end])
				ner = " ".join(ners[start:end])

				if not re.search('^[A-Z]', phrase): continue
				if not re.search('^(LOCATION\s*)+$', ner) and phrase.lower() not in ['iowa']: continue

				if phrase.lower() in locmapping and 'river' not in phrase.lower():
					nearest_number = -1
					for i in range(end, len(words)):
						if re.search('^[0-9][0-9][0-9][0-9]$', words[i]):
							nearest_number = i
							break
					if nearest_number != -1 and (nearest_number - end) < 3: badnames[phrase.lower()] = 1
				
					nearest_number = -1
					for i in range(end, len(words)):
						if re.search('^et$', words[i].lower()):
							nearest_number = i
							break
					if nearest_number != -1 and (nearest_number - end) < 3: badnames[phrase.lower()] = 2


	started = False
	ended = False
	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) in \
		ddlib.from_bazaar_doc(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts):

		sentid = int(sentid)

		history = {}
		for start in range(0, len(words)):
			for end in reversed(range(start + 1, min(len(words)+1, start + 1 + MAXPHRASELEN))):

				if start in history: continue

				phrase = " ".join(words[start:end])
				ner = " ".join(ners[start:end])

				if not re.search('^[A-Z]', phrase): continue
				if not re.search('^(LOCATION\s*)+$', ner) and phrase.lower() not in ['iowa']: continue

				nearest_number = -1
				for i in range(end, len(words)):
					if re.search('^[0-9][0-9][0-9][0-9]$', words[i]):
						nearest_number = i
						break
				if nearest_number != -1 and (nearest_number - end) < 8: continue
				
				nearest_number = -1
				for i in range(end, len(words)):
					if re.search('^et$', words[i].lower()):
						nearest_number = i
						break
				if nearest_number != -1 and (nearest_number - end) < 3: continue

				if phrase.lower() in locmapping and phrase.lower() not in badnames:
					
					eid = "LOCATION_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
					prov = json.dumps([sentid, "%d"%start, "%d"%(end-1), phrase])
					name = id2ents[locmapping[phrase.lower()]]

					print "\t".join([docid, "LOCATION", eid, name, prov])
					for i in range(start, end):
						history[i] = 1

