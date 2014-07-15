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
		e = knobs[i+1]
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

	good_names = {}
	local_entity_types = {}
	local_entities = {}
	i = 0
	for ent in _local_entities:
		local_entities[ent] = 1
		good_names[ent] = ent
		good_names[ent[0:ent.rindex(' ')]] = ent
		local_entity_types[ent] = _local_entity_types[i]
		i = i + 1

	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes) in \
		get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):
		
		for start in range(0, len(words)):
			for end in reversed(range(start + 1, min(len(words), start + 1 + MAXPHRASELEN))):
				phrase = " ".join(words[start:end])
				lemma = " ".join(lemmas[start:end])
				lemma = lemma.replace('Sandstones', 'Sandstone')

				if phrase.lower() in good_names:
					c= True
					if phrase.lower() not in local_entities:
						
						eid = "ROCK_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
						prov = [sentid, "%d"%start, "%d"%(end-1), phrase]
						name = good_names[phrase.lower()]

						print json.dumps({"docid":docid, "type":local_entity_types[name], "eid":eid, "entity": name, "prov":prov})



