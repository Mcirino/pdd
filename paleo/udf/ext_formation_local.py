#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json

dict_intervals = {}
stop_words = {}
rocktypes = {"formation":1, "group":1, "member":1, "shale":1, "slate":1, "marble":1, "formations":1, 
		"groups":1, "members":1, "shales":1, "facies":1, "slates":1, "marbles":1, "limestone":1, 'tuff':1, 
		'beds':1, 'bed':1, "face":1, "sandstones":1, "sandstone":1, "siltstone":1, "dolomite":1, 
		"conglomerate":1, "chert":1, "coal":1, "breccia":1, "silt":1, "sand":1, "claystone":1, "clay":1, 
		"arkose":1, "evaporite":1,
		"anhydrite":1, "gypsum":1, "mudstone":1, "marl":1, "argillite":1, "supergroup":1, "greensand":1, 
		"grit":1, "flysch":1, "chalk":1, "oolite":1, "ash":1, "volcanics":1, "molasse":1, "schist":1, 
		"phosphorite":1, "quartzite":1}
BADFORMATIONNAME = {"lower":1,"upper":1,"middle":1}

for l in open(ddlib.BASE_FOLDER + '/dicts/intervals.tsv', 'r'):
	(begin, end, name) = l.rstrip().split('\t')
	dict_intervals[name.lower()] = name + '|' + begin + '|' + end
	va = name.lower().replace('late ', 'upper ').replace('early ', 'lower')
	if va != name.lower():
		dict_intervals[va] = name + '|' + begin + '|' + end
        
for l in open(ddlib.BASE_FOLDER + '/dicts/english.stop', 'r'):
	stop_words[l.strip().lower()] = 1

MAXPHRASELEN = 5

for _row in sys.stdin:
	
	(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) = ddlib.from_bazaar(_row)

	history = {}
	for start in range(0, len(words)):
		for end in reversed(range(start + 1, min(len(words), start + 1 + MAXPHRASELEN))):
			if start in history or end in history: continue

			phrase = " ".join(words[start:end])
			ner = " ".join(ners[start:end])
			lemma = " ".join(lemmas[start:end])

			phrase_lower, ner_lower, lemma_lower = phrase.lower(), ner.lower(), lemma.lower()

			rocktype = lemmas[end - 1].lower()
			if rocktype not in rocktypes:
				continue
			
			if (re.search('^([A-Z][a-zA-Z][a-zA-Z]+\s*|de\s*)*$', phrase) and start>0) or \
				re.search('^([A-Z][a-zA-Z][a-zA-Z][a-zA-Z]+\s*|de\s*)*$', phrase) or 	  \
				re.search('^[A-Z][a-z] ([A-Z][a-zA-Z][a-zA-Z][a-zA-Z]+\s*)*$', phrase):

				word = phrase_lower
				if ' ' in phrase:
					word = phrase_lower[:phrase.index(' ')]
				if len(word.strip())<=4 and word.lower() in stop_words: continue

				for lastword in [rocktype,]:
					if phrase_lower.endswith(' ' + lastword) and phrase.lower() != lastword:
						contains = False
						for interval in dict_intervals:
							if interval.lower() in phrase_lower:
								contains = True
						for badname in BADFORMATIONNAME:
							if badname + " " in phrase_lower:
								contains = True

						if contains == False:
							name = phrase_lower
							if phrase_lower.endswith('bed') or phrase_lower.endswith('beds') or \
								phrase_lower.endswith('tuff') or 								\
								(phrase_lower + " " + lastword).lower().endswith('limestone'):	\
								name = name + ' ' + 'formation'
							if not (lemma_lower.endswith(' facies') or lemma_lower.endswith(' face')): 

								eid = "ROCK_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
								prov = json.dumps([sentid, "%d"%start, "%d"%(end-1), phrase])
								#prov = "ext_formatoin_location.py"

								#print json.dumps({"docid":docid, "type":rocktype, "eid":eid, "entity": name, "prov":prov, "is_correct":None})
								
								print "\t".join([docid, rocktype, eid, name, prov])

								for i in range(start, end): history[i] = 1











