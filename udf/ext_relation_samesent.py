#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json
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
				knobs.append(i - ct0)

	j = 0
	for i in range(0, len(knobs)-1):
		s = knobs[i]
		e = knobs[i+1]
		yield (_docid, _sentids[j], _wordidxs[s:e], _words[s:e], _poses[s:e], _ners[s:e], _lemmas[s:e], _dep_paths[s:e], _dep_parents[s:e], _bounding_boxes[s:e])
		j = j + 1

def wordseq_feature(e1, e2, docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes):
	begin1 = e1.start
	end1 = e1.end
	begin2 = e2.start
	end2 = e2.end

	start = end1 + 1
	finish = begin2 - 1
	prefix = ""

	if end2 <= begin1:
		start = end2 + 1
		finish = begin1 - 1
		prefix = "INV:"

	ss = []
	for w in range(start, min(finish + 1, len(words))):
		if ners[w] == 'O':
			ss.append(words[w].encode('ascii', 'ignore'))
		else:
			ss.append(ners[w])

	return prefix + "_".join(ss)

#def dep_path(e1, e2, docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes):


Mention = collections.namedtuple('Mention', ['entity', 'eid', 'start', 'end', 'type'])

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

	#ddlib.log(_types)
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

	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes) in \
		get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):

		if sentid in sent_2_entities and len(sent_2_entities) >= 2:
			entities = sent_2_entities[sentid]

			rels ={}
			rels['FORMATIONLOCATION']={}

			for e1 in entities:
				for e2 in entities:
					if 'species' in e1.type and 'genus' in e2.type and e1.entity.lower().startswith(e2.entity.lower()):
						continue

					if e1 == e2: continue

					ws = wordseq_feature(e1, e2, docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes)
					#ws_dep = doc.sents[sent].dep_path(e1, e2)
				
					if e1.type in ranks and e2.type in ranks:
						if ranks[e1.type] < ranks[e2.type]:
							print json.dumps({"docid":docid, "type":"TAXONOMY", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})

					if ';' in ws and len(words) > 10:
						continue
					
					if e1.type not in ['FORMATION', 'LOCATION', 'INTERVAL'] and e2.type == 'LOCATION':
						print json.dumps({"docid":docid, "type":"LOCATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})

					if e1.type not in ['FORMATION', 'LOCATION', 'INTERVAL'] and e2.type == 'FORMATION':
						print json.dumps({"docid":docid, "type":"FORMATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})

					if e1.type == 'FORMATION' and e2.type == 'LOCATION':
						print json.dumps({"docid":docid, "type":"FORMATIONLOCATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})

						if e1.entity not in rels['FORMATIONLOCATION']:
							rels['FORMATIONLOCATION'][e1.entity] = (math.fabs(e1.start-e2.start), e1, e2) 
						else:
							if math.fabs(e1.start-e2.start) < rels['FORMATIONLOCATION'][e1.entity][0]:
								rels['FORMATIONLOCATION'][e1.entity]=(math.fabs(e1.start-e2.start), e1, e2)

					if e1.type == 'FORMATION' and e2.type == 'INTERVAL':
						print json.dumps({"docid":docid, "type":"FORMATIONINTERVAL", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})

			for ent in rels['FORMATIONLOCATION']:
				e1 = rels['FORMATIONLOCATION'][ent][1]
				e2 = rels['FORMATIONLOCATION'][ent][2]
				ddlib.log("~~~~~~~~~~~~~~")
				print json.dumps({"docid":docid, "type":"FORMATIONINTERVAL", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT-NEAREST]"})





