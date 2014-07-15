#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json

dict_fossils = {}
dict_species_lastword = {}	
dict_english = {}
dict_locations = {}

words = {}
pprev = ""
prev = ""

for l in open(ddlib.BASE_FOLDER + '/dicts/words'):
	dict_english[l.rstrip().lower()] = 1

for l in open(ddlib.BASE_FOLDER + '/dicts/paleodb_taxons.tsv'):
	try:
		(rawname, rank) = l.rstrip().split('\t')
		
		ss = rawname.split(' ')
		if len(ss) == 1:
			dict_fossils[ss[0].lower()] = rank
		elif len(ss) == 2:
			if '(' not in rawname:
				dict_fossils[rawname.lower()] = rank
				dict_fossils[ss[0]] = "genus"
			else:
				for s in ss:
					if '(' in s:
						s = s.replace('(', '').replace(')', '')
					if 'species' in rank and ' ' not in s: continue
					dict_fossils[s.lower()] = rank
		elif len(ss) == 3:
			if '(' not in rawname:
				dict_fossils[name.lower()] = rank
			elif '(' in ss[1] and '(' not in ss[2] and '(' not in ss[0]:
				dict_fossils[(ss[0]+" "+ss[2]).lower()] = rank
				dict_fossils[(ss[1].replace('(', '').replace(')', '')+" "+ss[2]).lower()] = rank

		if 'species' in rank and len(ss) > 1 and len(ss[-1]) > 2:
			dict_species_lastword[ss[-1].lower()] = 1
	
	except:
		continue

MAXPHRASELEN = 5

def get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):

	knobs = []
	ct0 = 0
	for i in range(0, len(_wordidxs)):
		if i == 0: 
			knobs.append(i)
		else:
			if _wordidxs[i] == 0:
				ct0 = ct0 + 1
				knobs.append(i - ct0)

	j = 0
	for i in range(0, len(knobs)-1):
		s = knobs[i]
		if s != 0: s = s + 1
		e = knobs[i+1] + 1
		yield (_docid, _sentids[j], _wordidxs[s:e], _words[s:e], _poses[s:e], _ners[s:e], _lemmas[s:e], _dep_paths[s:e], _dep_parents[s:e], _bounding_boxes[s:e])
		j = j + 1

for _row in sys.stdin:
	row = json.loads(_row)
	_docid = row["docid"]
	_sentids = row["sentids"]
	_wordidxs = row["wordidxs"]
	_words = row["words"]
	_poses = row["poses"]
	_ners = row["ners"]
	_lemmas = row["lemmas"]
	_dep_paths = row["dep_paths"]
	_dep_parents = row["dep_parents"]
	_bounding_boxes = row["bounding_boxes"]
	_local_entities = row["local_entities"]
	_local_entity_types = row["local_entity_types"]

	possible_shortphrase = {}
	obvious_fossil_name = {}

	i = 0
	for ent in _local_entities:
		t = _local_entity_types[i]
		obvious_fossil_name[ent] = t
		i = i + 1

	i = 0
	for ent in _local_entities:
		t = _local_entity_types[i]
		i = i + 1
		ss = ent.split(' ')
		if len(ss) == 2:
			shortphrase = ss[0][0] + '. ' + ss[1]
			if shortphrase not in possible_shortphrase: possible_shortphrase[shortphrase] = {}
			possible_shortphrase[shortphrase][ent] = obvious_fossil_name[ent]

	last_genus = ""
	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes) in \
		get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):
		
		history = {}
		for start in range(0, len(words)):
			for end in reversed(range(start + 1, min(len(words), start + 1 + MAXPHRASELEN))):
				phrase = " ".join(words[start:end])
				ner = " ".join(ners[start:end])
				lemma = " ".join(lemmas[start:end])

				if end<len(words):
					n_word = words[end]
					if n_word.lower().endswith('zone'):
						continue
				if end<len(words)-1:
					n_word = words[end+1]
					if n_word.lower().endswith('zone'):
						continue
		
				ss = phrase.split(' ')
				isvalid = True
				if not re.search('^[A-Z]', ss[0]): isvalid = False
				for i in range(1, len(ss)):
					if re.search('^[A-Z]', ss[i]) and not re.search('^[A-Z]*$', ss[i]):
						isvalid = False
				if isvalid == False: continue

				if phrase.lower() in obvious_fossil_name:
					if 'genus' in obvious_fossil_name[phrase.lower()]:
						last_genus = phrase.lower()
			
				if words[start].endswith('.') and len(words[start]) == 2:

					eid = "TAXON_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
					prov = [sentid, "%d"%start, "%d"%(end-1), phrase]

					if phrase.lower() in possible_shortphrase:
						for longphrase in possible_shortphrase[phrase.lower()]:
							t = possible_shortphrase[phrase.lower()][longphrase]

							print json.dumps({"docid":docid, "type":t, "eid":eid, "entity": longphrase, "prov":prov, "author_year":"", "is_correct":None})

					else:
						if len(ss) == 2 and last_genus.startswith(words[start][0].lower()):
							testname = last_genus + ' ' + " ".join(words[(start+1):end]).lower()
							if testname in dict_fossils: 
								t = dict_fossils[testname]
								print json.dumps({"docid":docid, "type":t, "eid":eid, "entity": longphrase, "prov":prov, "author_year":"", "is_correct":None})
