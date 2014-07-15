#! /usr/bin/env pypy

import sys
import json

for _row in sys.stdin:

	row = json.loads(_row)

	formation = row["formation"]
	interval1 = row["interval1"]
	interval2 = row["interval2"]

	(name1, large1, small1) = interval1.split('|')
	(name2, large2, small2) = interval2.split('|')

	large1 = float(large1)
	large2 = float(large2)
	small1 = float(small1)
	small2 = float(small2)

	if small1 > large2 + 50:
		print json.dumps({"formation":formation, "interval1":interval1, "interval2":interval2})
	
	if small2 > large1 + 50:
		print json.dumps({"formation":formation, "interval1":interval1, "interval2":interval2})
	
	if ( max(large1, large2) - min(small1, small2) > 50 and large2-small2<50 and large1-small1 < 50):
		print json.dumps({"formation":formation, "interval1":interval1, "interval2":interval2})
