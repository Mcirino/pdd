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

RE_CF_ATOZ = re.compile(' cf\. [A-Z]\.')
RE_CF = re.compile(' cf\.')
RE_SIC = re.compile(' ( sic ) ')

RE_AFF1 = re.compile(r'\baff\b')
RE_AFF2 = re.compile(r'\baff\.\b')
RE_INC1 = re.compile(r'\bincertae\b')
RE_INC2 = re.compile(r'\bindet\b')

RE_START_ATOZ = re.compile(r'^[A-Z]')
RE_START_ATOZSTAR_END = re.compile(r'^[A-Z]*$')

ranks = {"subgenus":3,"genus":4,"subtribe":5,"tribe":6,"subfamily":7,"family":8,"group":9,
	"superfamily":10,"infraorder":11,"suborder":12,"order":13,"superorder":14,"infraclass":15,
	"subclass":16,"class":17,"superclass":18,"subphylum":19,"phylum":20,"superphylum":21,"subkingdom":22,
	"kingdom":23,"superkingdom":24}

MAXPHRASELEN = 7

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

			if 'cf.' in phrase or 'sic' in phrase:
				phrase2 = re.sub(RE_CF_ATOZ, '', phrase)
				phrase = phrase2

 		   		phrase2 = re.sub(RE_CF, '', phrase)
	 			phrase = phrase2

				phrase2 = re.sub(RE_SIC, '', phrase)
				phrase = phrase2

			lphrase = phrase.lower()

			genus_reso = None
			if 'aff' in lphrase or 'incertae' in lphrase or 'indet' in lphrase:

				if 'aff' in lphrase:
					genus_reso = 'aff'
				if 'incertae' in lphrase:
					genus_reso = 'incertae' 
				if 'indet' in lphrase:
					genus_reso = 'indet'

				if re.search(RE_AFF1, lphrase):
					continue
				if re.search(RE_AFF2, lphrase):
					continue
				if re.search(RE_INC1, lphrase):
					continue
				if re.search(RE_INC2, lphrase):
					continue

			prerank = None
			for prew in range(max(0, start-1), start):
				if words[prew].lower() in ranks:
					prerank = words[prew].lower()

			ss = phrase.split(' ')
			lss = len(ss)
			
			isvalid = True
			if not prerank and not re.search(RE_START_ATOZ, ss[0]): 
				isvalid = False
			
			for i in range(1, lss):
				if not prerank and re.search(RE_START_ATOZ, ss[i]) and not re.search(RE_START_ATOZSTAR_END, ss[i]):
					isvalid = False

			inpar = False
			for i in range(1, lss):
				if '(' in ss[i]:
					inpar = True
					continue
				if ')' in ss[i]:
					inpar = False
					continue
				if inpar == False and re.search(RE_START_ATOZ, ss[i]) and not re.search(RE_START_ATOZSTAR_END, ss[i]):
					isvalid = False

			if isvalid == False: continue

			if inpar == True: continue

			if len(phrase) < 5: continue
			
			#if prerank == None and prerank == None and lphrase in dict_locations: continue
		
			eid = "TAXON_DOC_" + docid + "_%s_%d_%d" % (sentid, start, end-1)
			prov = [sentid, "%d"%start, "%d"%(end-1), phrase]

			if lphrase in dict_fossils:
				if prerank != None:
					print json.dumps({"docid":docid, "type":prerank, "eid":eid, "entity": lphrase, "prov":prov, "author_year":""})
				else:
					print json.dumps({"docid":docid, "type":dict_fossils[lphrase], "eid":eid, "entity": lphrase, "prov":prov, "author_year":""})
			elif ' ' not in lphrase and lphrase.endswith('idae') and lphrase not in dict_english:
 				if prerank != None:
					print json.dumps({"docid":docid, "type":prerank, "eid":eid, "entity": lphrase, "prov":prov, "author_year":""})
				else:
					print json.dumps({"docid":docid, "type":"family", "eid":eid, "entity": lphrase, "prov":prov, "author_year":""})
			else:		
				ss = phrase.split(' ')
				ssl = lphrase.split(' ')
				if len(ss) == 2:
					if ssl[0] in dict_fossils and 'genus' in dict_fossils[ssl[0]]:
						if ssl[1] in dict_species_lastword and ssl[1] not in dict_english:
							print json.dumps({"docid":docid, "type":"species", "eid":eid, "entity": lphrase, "prov":prov, "author_year":""})

				cleanup = []
				inpars = []
				inpar = False
				for s in ssl:
					if '(' in s:
						inpar = True
						continue
					if ')' in s:
						inpar = False
						continue
					if inpar == False:
						cleanup.append(s)
					else:
						inpars.append(s)

				if len(inpars) == 1 and inpars[0] in dict_fossils and 'genus' in dict_fossils[inpars[0]]:
					if nc == 1:
						if len(cleanup) == 1 and ss[0] != '(':
							if cleanup[0] in dict_fossils and 'genus' in dict_fossils[cleanup[0]]:
								print json.dumps({"docid":docid, "type":"subgenus", "eid":eid, "entity": " ".join(ssl), "prov":prov, "author_year":""})

					if nc == 1 and len(cleanup) == 2:
						if cleanup[0] in dict_fossils and 'genus' in dict_fossils[cleanup[0]]:
							if cleanup[1] in dict_species_lastword and cleanup[1] not in dict_english:

								print json.dumps({"docid":docid, "type":"species", "eid":eid, "entity": " ".join(ssl), "prov":prov, "author_year":""})
								
								eid2 = "TAXON_DOC_" + docid + "_%s_%d_%d" % (sentid, start, start)
								prov2 = [sentid, "%d"%start, "%d"%start, cleanup[0]]

								print json.dumps({"docid":docid, "type":"genus", "eid":eid2, "entity": cleanup[0], "prov":prov2, "author_year":""})



