#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json

ranks = {"subspecies":1,"species":2,"subgenus":3,"genus":4,"subtribe":5,"tribe":6,"subfamily":7,"family":8,"group":9,"superfamily":10,"infraorder":11,"suborder":12,"order":13,"superorder":14,"infraclass":15,"subclass":16,"class":17,"superclass":18,"subphylum":19,"phylum":20,"superphylum":21,"subkingdom":22,"kingdom":23,"superkingdom":24}

kb_taxonomy = {}
for l in open(ddlib.BASE_FOLDER + '/dicts/paleodb_taxonomy.tsv'):
	(refid, rel, tax1, tax2) = l.rstrip().split('\t')
	if 'belongs to' not in rel and 'ive synonym' not in rel: continue
	tax1 = tax1.lower()
	tax2 = tax2.lower()

	if 'belongs to' in rel: rel = 'TAXONOMY'
	if 'ive synonym' in rel: rel = 'TAXONOMY2'

	if tax1 not in kb_taxonomy:
		kb_taxonomy[tax1] = {}
	kb_taxonomy[tax1][tax2] = rel

for _row in sys.stdin:
	
	(docid, type, eid1, eid2, entity1, entity2, f) = _row.split('\t')

	#row = json.loads(_row)
	#docid = row["docid"]
	#type = row["type"]
	#eid1 = row["eid1"]
	#eid2 = row["eid2"]
	#entity1 = row["entity1"]
	#entity2 = row["entity2"]

	if type != "TAXONOMY" and type != "TAXONOMY2": continue

	if entity1==entity2:
		#nothing = True
		print "\t".join([docid, type, eid1, eid2, entity1, entity2, "\\N"])
		#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":None})
	else:
		if entity1 in kb_taxonomy:
			print "\t".join([docid, type, eid1, eid2, entity1, entity2, "\\N"])
			#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":None})
			if entity2 in kb_taxonomy[entity1]:
				if kb_taxonomy[entity1][entity2] == type:
					print "\t".join([docid, type, eid1, eid2, entity1, entity2, "1"])
					#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":True})
				else:
					print "\t".join([docid, type, eid1, eid2, entity1, entity2, "0"])
					#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":False})
			else:
				has_same_rel = False
				for ee in kb_taxonomy[entity1]:
					if kb_taxonomy[entity1][ee] == type:
						has_same_rel = True
				if has_same_rel == True:
					print "\t".join([docid, type, eid1, eid2, entity1, entity2, "0"])
					#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":False})
				else:
					print "\t".join([docid, type, eid1, eid2, entity1, entity2, "\\N"])
				#	print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":None})
		else:
			print "\t".join([docid, type, eid1, eid2, entity1, entity2, "\\N"])
		#	print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":None})




