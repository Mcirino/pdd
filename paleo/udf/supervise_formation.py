#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json

kb_fossil_formation = {}
for l in open(ddlib.BASE_FOLDER + '/dicts/supervision_occurrences.tsv'):
	(reference_no, genus, species, formation, member, group, country, n1, n2, n3, n4) = l.split('\t')
	n1 = float(n1)
	n2 = float(n2)
	n3 = float(n3)
	n4 = float(n4.rstrip())

	formation = formation.lower() + " formation"
	member = member.lower() + " member"
	group = group.lower() + " group"

	country = country.lower()

	for fossil in [genus.lower(), genus.lower() + ' ' + species.lower()]:
		for rock in [formation, member, group]:
			if fossil not in kb_fossil_formation:
				kb_fossil_formation[fossil] = {}
			if rock not in kb_fossil_formation[fossil]:
				kb_fossil_formation[fossil][rock] = {}
			kb_fossil_formation[fossil][rock][reference_no] = 1

for _row in sys.stdin:

	(docid, type, eid1, eid2, entity1, entity2, f) = _row.split('\t')

	#row = json.loads(_row)
	#docid = row["docid"]
	#type = row["type"]
	#eid1 = row["eid1"]
	#eid2 = row["eid2"]
	#entity1 = row["entity1"]
	#entity2 = row["entity2"]

	if type != "FORMATION": continue

	if entity1 in kb_fossil_formation:
		print "\t".join([docid, type, eid1, eid2, entity1, entity2, "\\N"])
		#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":None})
		if entity2 in kb_fossil_formation[entity1]:
			print "\t".join([docid, type, eid1, eid2, entity1, entity2, "1"])
			#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":True})
		else:
			print "\t".join([docid, type, eid1, eid2, entity1, entity2, "0"])
			#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":False})
	else:
		print "\t".join([docid, type, eid1, eid2, entity1, entity2, "\\N"])
		#print json.dumps({"docid":docid, "type":type, "eid1":eid1, "eid2":eid2, "entity1":entity1, "entity2":entity2, "is_correct":None})



