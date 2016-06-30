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
		if s != 0: s = s + 1
		e = knobs[i+1] + 1
		yield (_docid, _sentids[j], _wordidxs[s:e], _words[s:e], _poses[s:e], _ners[s:e], _lemmas[s:e], _dep_paths[s:e], _dep_parents[s:e], _bounding_boxes[s:e])
		j = j + 1

def wordseq_feature(e1, e2, docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents):
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
			ss.append(words[w].decode('ascii', 'ignore'))
		else:
			ss.append(ners[w])

	return prefix + "_".join(ss)

#def dep_path(e1, e2, docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes):

Mention = collections.namedtuple('Mention', ['entity', 'eid', 'start', 'end', 'type'])

for _row in sys.stdin:


	try:
		(_docid, _entities, _types, _eids, _provs,
			_sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts) = _row.split('\t')
		_entities = _entities.split('@@@@@')
		_types = _types.split('@@@@@')
		_eids = _eids.split('@@@@@')
		_provs = _provs.split('@@@@@')
	except:
		ddlib.log(_row)
		continue

	#ddlib.log(_types)
	sent_2_entities = {}
	for i in range(0, len(_types)):
		t = _types[i].split('-')[-1]
		e = _entities[i]
		eid = _eids[i]
		#ddlib.log(_provs[i])
		_provs[i] = json.loads(_provs[i])
		sentid = _provs[i][0]
		start = int(_provs[i][1])
		end = int(_provs[i][2])
		if sentid not in sent_2_entities:
			sent_2_entities[sentid] = []
		sent_2_entities[sentid].append(Mention(e, eid, start, end, t))

	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) in \
		ddlib.from_bazaar_doc(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts):

		if sentid in sent_2_entities and len(sent_2_entities) >= 2:

			myobj = {}
			myobj['lemma'] = lemmas
			myobj['words'] = words
			myobj['dep_graph'] = []
			#print words
			#print lemmas
			for i in range(0,len(words)):
				#print dep_parents[i]
				myobj['dep_graph'].append("%d\t"%(dep_parents[i]-1) +dep_paths[i] + "\t" + "%d"%(i))
			word_obj_list = ddlib.unpack_words(myobj, lemma='lemma', words='words', dep_graph='dep_graph')

			entities = sent_2_entities[sentid]

			rels ={}
			rels['FORMATIONLOCATION']={}

			for e1 in entities:
				for e2 in entities:
					if 'species' in e1.type and 'genus' in e2.type and e1.entity.lower().startswith(e2.entity.lower()):
						continue

					if e1 == e2: continue

					ws = wordseq_feature(e1, e2, docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents)
					#ws_dep = doc.sents[sent].dep_path(e1, e2)
					try:
						edges = ddlib.dep_path_between_words(word_obj_list, e1.end, e2.end)
					except:
						edges = []
					#print edges
					if len(edges) > 0:
						num_roots = 0 # the number of root nodes
						num_left = 0 # the number of edges to the left of the root
						num_right = 0 # the number of edges to the right of the root
						left_path = "" # the dependency path to the left of the root
						right_path = "" # the dependency path to the right of the root
						
                # find the index of the switch from up to down
						switch_direction_index = -1
						for i in range(len(edges)):
							if not edges[i].is_bottom_up:
								switch_direction_index = i
								break
                
                # iterate through the edge list
						for i in range(len(edges)):
							curr_edge = edges[i]

                    # count the number of roots; if there are more than 1 root then our dependency
                    # path is disconnected
							if curr_edge.label == 'ROOT':
								num_roots += 1

                    # going from the left to the root
							if curr_edge.is_bottom_up:
								num_left += 1

                        # if this is the edge pointing to the root (word2 is the root)
								if i == switch_direction_index - 1:
									left_path = left_path + ("--" + curr_edge.label + "->")
									root = curr_edge.word2.lemma.lower()

                        # this edge does not point to the root
								else:
                            # if we are at the last edge, don't include the word (part of the mention)
									if i == len(edges) - 1:
										left_path = left_path + ("--" + curr_edge.label + "->")
									else:
										left_path = left_path + ("--" + curr_edge.label + "->" + curr_edge.word2.lemma.lower())
                    
                    # going from the root to the right
							else:
								num_right += 1

                        # the first edge to the right of the root
								if i == switch_direction_index:
									right_path = right_path + "<-" + curr_edge.label + "--"

                        # this edge does not point from the root
								else:
                            # if we are at the first edge, don't include the word (part of the mention)
									if i == 0:
										right_path = right_path + ("<-" + curr_edge.label + "--")
									else:
                                # word1 is the parent for right to left
										right_path = right_path + (curr_edge.word1.lemma.lower() + "<-" + curr_edge.label + "--")
                
                # if the root is at the end or at the beginning (direction was all up or all down)
						if num_right == 0:
							root = "|SAMEPATH"
						elif num_left == 0:
							root = "SAMEPATH|"

                # if the edges have a disconnect
						elif num_roots > 1:
							root = "|NONEROOT|"

                # this is a normal tree with a connected root in the middle
						else:
							root = "|" + root + "|"
						path = left_path + root + right_path
						#print path

					if e1.type in ranks and e2.type in ranks:
						if ranks[e1.type] < ranks[e2.type]:
							print "\t".join([docid, "TAXONOMY", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + ws + "] "])
							print "\t".join([docid, "TAXONOMY", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + path + "] "])
							#print json.dumps({"docid":docid, "type":"TAXONOMY", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})
							#print json.dumps({"docid":docid, "type":"TAXONOMY", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + path + "] "})
							
					if ';' in ws and len(words) > 10:
						continue
					
					if e1.type not in ['FORMATION', 'LOCATION', 'INTERVAL'] and e2.type == 'LOCATION':
						print "\t".join([docid, "LOCATION", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + ws + "] "])
						print "\t".join([docid, "LOCATION", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + path + "] "])

						#print json.dumps({"docid":docid, "type":"LOCATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})
						#print json.dumps({"docid":docid, "type":"LOCATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + path + "] "})

					if e1.type not in ['FORMATION', 'LOCATION', 'INTERVAL'] and e2.type == 'FORMATION':
						#print json.dumps({"docid":docid, "type":"FORMATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})
						#print json.dumps({"docid":docid, "type":"FORMATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + path + "] "})

						print "\t".join([docid, "FORMATION", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + ws + "] "])
						print "\t".join([docid, "FORMATION", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + path + "] "])


					if e1.type == 'FORMATION' and e2.type == 'LOCATION':
						print "\t".join([docid, "FORMATIONLOCATION", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + ws + "] "])
						print "\t".join([docid, "FORMATIONLOCATION", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + path + "] "])

						#print json.dumps({"docid":docid, "type":"FORMATIONLOCATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})
						#print json.dumps({"docid":docid, "type":"FORMATIONLOCATION", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + path + "] "})

						if e1.entity not in rels['FORMATIONLOCATION']:
							rels['FORMATIONLOCATION'][e1.entity] = (math.fabs(e1.start-e2.start), e1, e2) 
						else:
							if math.fabs(e1.start-e2.start) < rels['FORMATIONLOCATION'][e1.entity][0]:
								rels['FORMATIONLOCATION'][e1.entity]=(math.fabs(e1.start-e2.start), e1, e2)

					if e1.type == 'FORMATION' and e2.type == 'INTERVAL':
						#print json.dumps({"docid":docid, "type":"FORMATIONINTERVAL", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + ws + "] "})
						#print json.dumps({"docid":docid, "type":"FORMATIONINTERVAL", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT PROV=" + path + "] "})

						print "\t".join([docid, "FORMATIONINTERVAL", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + ws + "] "])
						print "\t".join([docid, "FORMATIONINTERVAL", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT PROV=" + path + "] "])

			for ent in rels['FORMATIONLOCATION']:
				e1 = rels['FORMATIONLOCATION'][ent][1]
				e2 = rels['FORMATIONLOCATION'][ent][2]
				#ddlib.log("~~~~~~~~~~~~~~")
				#print json.dumps({"docid":docid, "type":"FORMATIONINTERVAL", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SAMESENT-NEAREST]"})
				print "\t".join([docid, "FORMATIONINTERVAL", e1.eid, e2.eid, e1.entity, e2.entity, "[SAMESENT-NEAREST]"])
