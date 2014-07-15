#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json
import math
import collections

ranks = {"subspecies":1,"species":2,"subgenus":3,"genus":4,"subtribe":5,"tribe":6,"subfamily":7,"family":8,"group":9,"superfamily":10,"infraorder":11,"suborder":12,"order":13,"superorder":14,"infraclass":15,"subclass":16,"class":17,"superclass":18,"subphylum":19,"phylum":20,"superphylum":21,"subkingdom":22,"kingdom":23,"superkingdom":24}

def get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):

	knobs = []
	ct0 = 0
	for i in range(0, len(_wordidxs)):
		if i == 0: 
			knobs.append(i)
		else:
			if _wordidxs[i] == 0:
				ct0 = ct0 + 1
				knobs.append(i - ct0 + 1)

	j = 0
	for i in range(0, len(knobs)-1):
		s = knobs[i]
		if s != 0: s = s + 1
		e = knobs[i+1] + 1

		yield (_docid, _sentids[j], _wordidxs[s:e], _words[s:e], _poses[s:e], _ners[s:e], _lemmas[s:e], _dep_paths[s:e], _dep_parents[s:e], _bounding_boxes[s:e])
		j = j + 1
			
fonts = {}

Mention = collections.namedtuple('Mention', ['entity', 'eid', 'start', 'end', 'type'])
Sentence = collections.namedtuple('Sentence', ['docid', 'sentid', 'wordidxs', 'words', 'poses', 'ners', 'lemmas', 'dep_paths', 'dep_parents', 'bounding_boxes'])

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
	_types = row["entity_types"]
	_eids = row["entity_eids"]
	_provs = row["entity_provs"]
	_entities = row["entities"]
	_table_ids = row["table_ids"]
	_line_types = row["line_types"]
	_line_sentids = row["line_sentids"]

	sent_2_entities = {}
	for i in range(0, len(_types)):
		t = _types[i].split('-')[-1]
		e = _entities[i]
		eid = _eids[i]
		sentid = _provs[i][0]
		start = int(_provs[i][1])
		end = int(_provs[i][2])
		if sentid not in sent_2_entities:
			sent_2_entities[sentid] = []
		sent_2_entities[sentid].append(Mention(e, eid, start, end, t))

	tables = {}
	for i in range(0,len(_table_ids)):
		tableid = _table_ids[i]
		linetype = _line_types[i]
		linesentid = _line_sentids[i]
		if tableid not in tables: tables[tableid] = {}
		tables[tableid][linesentid] = linetype

	sents = {}
	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes) in \
		get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):
		
		sents[sentid] = Sentence(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes)


	for tableid in tables:
   		capentities = []
   		for sentid in tables[tableid]:
   			if tables[tableid][sentid] == 'CAPTION':
   				if sentid in sent_2_entities:
	   				for e in sent_2_entities[sentid]:
   						capentities.append(e)
		contententities = []
		for sentid in tables[tableid]:
			if tables[tableid][sentid] == 'CONTENT':
				if sentid in sent_2_entities:
					for e in sent_2_entities[sentid]:
						contententities.append(e)

		for capentity in capentities:
			for contententity in contententities:
				if contententity.type not in ['FORMATION', 'LOCATION', 'INTERVAL']:
					if capentity.type == 'FORMATION':
						print json.dumps({"docid":docid, "type":"FORMATION", "eid1":contententity.eid, "eid2":capentity.eid, "entity1":contententity.entity, "entity2":capentity.entity, "features":"[TABLE CAPTION] "})

