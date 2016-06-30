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

def get_sents2(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes, _centereds, _followeds, _left_margins, _boxes):

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
		yield (_docid, _sentids[j], _wordidxs[s:e], _words[s:e], _poses[s:e], _ners[s:e], _lemmas[s:e], _dep_paths[s:e], _dep_parents[s:e], _bounding_boxes[s:e], _centereds[s:e], _followeds[s:e], _left_margins[s:e], _boxes[s:e])
		j = j + 1


class Box:
	
	left = None
	right = None
	top = None
	bottom = None
	page = None

	strform = ""

	def __init__(self, str):
		m = re.search('p([0-9]*)l([0-9]*)t([0-9]*)r([0-9]*)b([0-9]*)', str)
		if m: 
			(self.page, self.left, self.top, self.right, self.bottom) = (int(m.group(1)), int(m.group(2)), int(m.group(3)), int(m.group(4)), int(m.group(5)))
		self.strform = str

	def __repr__(self):
		return self.strform

	def overlap(self, b2):
		if self.page == b2.page:
			hoverlap = (self.right-self.left) + (b2.right-b2.left) - (max(self.right, b2.right) - min(self.left, b2.left))
			voverlap = (self.bottom-self.top) + (b2.bottom-b2.top) - (max(self.bottom, b2.bottom) - min(self.top, b2.top))
			if hoverlap >=0 and voverlap >=0:
				return True
		return False
			
fonts = {}

Mention = collections.namedtuple('Mention', ['entity', 'eid', 'start', 'end', 'type'])
Sentence = collections.namedtuple('Sentence', ['docid', 'sentid', 'wordidxs', 'words', 'poses', 'ners', 'lemmas', 'dep_paths', 'dep_parents', 'fonts', 'layouts'])

def syn(sents):

	lastsent = None
	last_sent_entities = []
	lastsent_withgenus = None
	lastsent_withgenus_entities = []
	
	exts = {}
	
	syn_to_identify_not_all_cap = {}
	syn_to_identify_all_cap = {}

	history = {}

	for i in range(0,len(sents)):
		sent = sents[i]
		sentid = sent.sentid

		if sentid not in sent_2_entities: continue

		isnextgood = False
		nextsentid = i + 1
		if nextsentid < len(sents):
			nextsent = sents[nextsentid]
			if sents[nextsentid].layouts[0] == 'CENTERED' and sents[nextsentid].words[0].startswith('Fig'):
				isnextgood = True
										
		firstentity_index = 10000
		firstentity = None
		for e in sent_2_entities[sentid]:
			if e.start < firstentity_index and 'species' in e.type:
				firstentity_index = e.start
				firstentity = e

		if firstentity == None:
			for e in sent_2_entities[sentid]:
				if e.start < firstentity_index and 'genus' in e.type and 'Genus' in sent.words[0]:
					firstentity_index = e.start
					firstentity = e
		
		if firstentity != None:

			if (sent.layouts[firstentity.start] == 'CENTERED' or isnextgood == True) and \
			   ('genus' in firstentity.type) and len(sent.words) < 20:
			   	#sent.left_margins[firstentity.start] < 100 or ) 

			  	for j in range(i+1,min(i+100,len(sents))):
			  		sentid2 = sents[j].sentid
					sent2 = sents[j]
					if sentid2 not in sent_2_entities: continue

					exists_center = False
					for centered in sent2.layouts:
						if centered == 'CENTERED':
							exists_center = True
					if exists_center == True and j-i >= 5:
						break

					if sent2.words[0] in ['Description', 'Discussion', 'Material', 'Remarks', 'Matericzl', 'Remczrks', 'Type', 'Revised', 'Included', 'Diagnosis', 'Referred', '']:
						break

					firstentity_index2 = 10000
					firstentity2 = None
					doesbreak = False
					hh = {}
					for e in sent_2_entities[sentid2]:
						if e.entity in hh:
							continue
						hh[e.entity] = 1

						if ('species' in e.type and 'species' in firstentity.type):
							firstentity_index2 = e.start
							firstentity2 = e

							if sent2.layouts[firstentity2.start] == 'CENTERED':
								doesbreak = True
								break

							if sent2.layouts[firstentity2.start] != 'CENTERED' and sent2.layouts[firstentity2.start] == 'FOLLOWED'  and (firstentity_index2 < 3): # sent2.left_margins[firstentity2.start] < 100 

								allleft = True
								i = 0
								for w in sent2.words:
									if w == sent2.words[firstentity2.start]: break
									#if sent2.boxes[i].left >= sent2.boxes[firstentity2.start].right and sent2.layouts[i] != 'FOLLOWED':
									#	allleft = False
									if i >= firstentity2.start and sent2.layouts[i] != 'FOLLOWED':
										allleft = False
									i = i + 1

								#if allleft == True and sent2.boxes[firstentity2.start].page - sent2.boxes[firstentity.start].page <= 1 :
								if allleft == True and firstentity2.start - firstentity.start <= 100 :
									if firstentity2.entity != firstentity.entity:
										#print json.dumps({"docid":docid, "type":"TAXONOMY2", "eid1":firstentity2.eid, "eid2":firstentity.eid, "entity1":firstentity2.entity, "entity2":firstentity.entity, "features":"[SYSTEMATIC PALEONTOLOGY SECTION HEADER TYPE 1]"})
										print "\t".join([docid, "TAXONOMY2", firstentity2.eid, firstentity.eid, firstentity2.entity, firstentity.entity, "[SYSTEMATIC PALEONTOLOGY SECTION HEADER TYPE 1]"])

					if doesbreak == True:
						break


def belongs_to(sents):

	flag_start_context = False
	lastsent = None
	last_sent_entities = []
	lastsent_withgenus = None
	lastsent_withgenus_entities = []
	
	exts = {}
	
	syn_to_identify_not_all_cap = {}
	syn_to_identify_all_cap = {}
	
	history = {}
	goodsents = []

	lower_words = {}

	for i in range(0,len(sents)):
		sent = sents[i]
		sentid = sent.sentid

		if sentid not in sent_2_entities: continue
		if sentid not in lower_words:
			lower_words[sentid] = {}
		for w in sent.words:
			lower_words[sentid][w.lower()] = 1

		isnextgood = False
		nextsentid = i + 1
		if nextsentid < len(sents):
			nextsent = sents[nextsentid]
			if (nextsent.layouts[0] == 'CENTERED' or nextsent.layouts[0]== 'FOLLOWED') and \
			   (nextsent.words[0].startswith('Fig')):
				isnextgood = True
		flag_start_context = True

		if flag_start_context == True:
										
			firstentity_index = 10000
			firstentity = None
			for e in sent_2_entities[sentid]:
				if e.start < firstentity_index and e.type in ranks:
					firstentity_index = e.start
					firstentity = e
			if firstentity != None:
				allleft = True
				j = 0
				for w in sent.words:
					if w == sent.words[firstentity.start]: break
					#if sent.boxes[j].left >= sent.boxes[firstentity.start].right and sent.layouts[j] != 'CENTERED':
					if j >= firstentity.start and sent.layouts[j] != 'CENTERED':
						allleft = False
					j = j + 1

				if (sent.layouts[firstentity.start] == 'CENTERED' or isnextgood == True or \
					sent.layouts[firstentity.start] == 'FOLLOWED') and len(sent.words) < 20 and allleft == True:
					goodsents.append({"sentid":sentid, "isgood":True, "isentid":i})
				else:
					if sent.words[0].lower() in ranks:
						goodsents.append({"sentid":sentid, "isgood":True, "isentid":i})
					else:
						goodsents.append({"sentid":sentid, "isgood":False, "isentid":i})
			else:
				goodsents.append({"sentid":sentid, "isgood":False, "isentid":i})
	
	for i in range(0, len(goodsents)):
		sentid = goodsents[i]["sentid"]
		isgood = goodsents[i]["isgood"]
		istenid = goodsents[i]["isentid"]

		if isgood == True:
			nnn = 0
			isvalid = True
			for e1 in sent_2_entities[sentid]:
				if 'species' not in e1.type:
					isvalid = False
				if e1.type in ranks:
					nnn = nnn + 1

			if nnn < 6 and isvalid == True:
				for e1 in sent_2_entities[sentid]:
					for e2 in sent_2_entities[sentid]:
						if e1.type in ranks and e2.type in ranks:
							if ranks[e1.type] < ranks[e2.type] and 'species' not in e1.type and \
							   e1.type in lower_words[sentid] and \
							   e2.type in lower_words[sentid] :
							   	#ddlib.log("-------------")
							   	#ddlib.log(e1)
							   	#ddlib.log(e2)
							   	#ddlib.log("-------------")
								#print json.dumps({"docid":docid, "type":"TAXONOMY", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SYSTEMATIC PALEONTOLOGY SECTION HEADER TYPE 1]"})
								print "\t".join([docid, "TAXONOMY", e1.eid, e2.eid, e1.entity, e2.entity, "[SYSTEMATIC PALEONTOLOGY SECTION HEADER TYPE 1]"])


			for j in range(i+1, len(goodsents)):
				sentid2 = goodsents[j]["sentid"]
				isgood2 = goodsents[j]["isgood"]
				istenid2 = goodsents[j]["isentid"]

				if isgood2 == True:
					for e1 in sent_2_entities[sentid2]:
						for e2 in sent_2_entities[sentid]:

							if e1.type in ranks and e2.type in ranks and \
							   e2.type in lower_words[sentid] :
							   # e1.type in lower_words[sentid] and \
								if ranks[e1.type] < ranks[e2.type] and 'species' not in e1.type:
									#print e1.type, e2.type
									#print json.dumps({"docid":docid, "type":"TAXONOMY", "eid1":e1.eid, "eid2":e2.eid, "entity1":e1.entity, "entity2":e2.entity, "features":"[SYSTEMATIC PALEONTOLOGY SECTION HEADER TYPE 2]"})
									print "\t".join([docid, "TAXONOMY", e1.eid, e2.eid, e1.entity, e2.entity, "[SYSTEMATIC PALEONTOLOGY SECTION HEADER TYPE 2]"])
					break
				else:
					if sents[istenid2].layouts[0] == 'CENTERED':
						break


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

	sent_2_entities = {}
	for i in range(0, len(_types)):
		t = _types[i].split('-')[-1]
		e = _entities[i]
		eid = _eids[i]
		_provs[i] = json.loads(_provs[i])
		sentid = _provs[i][0]
		start = int(_provs[i][1])
		end = int(_provs[i][2])
		if sentid not in sent_2_entities:
			sent_2_entities[sentid] = []
		sent_2_entities[sentid].append(Mention(e, eid, start, end, t))

	"""
	for i in range(0, len(_properties)):
		prop = _properties[i]
		pageid,left_margin,top_margin,right_margin,bottom_margin = _boxes[i]
		box = Box("p%sl%st%sr%sb%s"%(pageid, left_margin, top_margin, right_margin, bottom_margin))
		if pageid not in fonts: fonts[pageid] = []
		fonts[pageid].append({"type":prop, "box":box})
	"""

	"""
	_centereds = []
	_followeds = []
	_left_margins = []
	_boxes = []
	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) in \
		ddlib.from_bazaar_doc(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts):
		
		for b in bounding_boxes:
			box = Box(b)
			_boxes.append(box)
			centered = False
			followed = False
			left_margin = None
			if box.page in fonts:
				for b2 in fonts[box.page]:
					if box.overlap(b2["box"]) == True:
						if b2["type"] == 'CENTERED':
							centered = True
						if b2["type"] == 'FOLLOWED':
							followed = True
						if b2["type"] == "CENTERED" or b2["type"] == "FOLLOWED":
							left_margin = min(left_margin, math.fabs(b2["box"].left - box.left))
			_centereds.append(centered)
			_followeds.append(followed)
			_left_margins.append(left_margin)

	"""

	sents = []
	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts) in \
		ddlib.from_bazaar_doc(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _fonts, _layouts):
		
		sent = Sentence(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, fonts, layouts)
		sents.append(sent)

	belongs_to(sents)
	syn(sents)









