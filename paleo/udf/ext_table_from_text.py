#! /usr/bin/env pypy

from lib import dd as ddlib
import re
import sys
import json
import collections

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

	sents = []
	for (docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes) in \
		get_sents(_docid, _sentids, _wordidxs, _words, _poses, _ners, _lemmas, _dep_paths, _dep_parents, _bounding_boxes):
		
		sents.append(Sentence(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, bounding_boxes))
	
	history = {}
	captions = {}
	contents = {}
	j = 0
	for i in range(0, len(sents)):
		sent = sents[i]
		sentid = sent.sentid
		if sentid in history: continue
		nword = len(sent.words)

		
		if re.search('^(Table|TABLE) [0-9]* \.', " ".join(sent.words)) or (re.search('^(Table|TABLE) [0-9IVl]*', " ".join(sent.words)) and not 	" ".join(sent.words).endswith('.')) or (re.search('^(Table|TABLE) [0-9IVl]*$', " ".join(sent.words))):

			j = j + 1
			captions[j] = []
			contents[j] = []

			captions[j].append(sent)
			remainid = i

			for remainid in range(remainid+1, len(sents)):
				remainsent = sents[remainid]
				
				if " ".join(remainsent.words).endswith('.') or " ".join(remainsent.words).endswith('?') or \
					not re.search('[a-z]', " ".join(remainsent.words)) or re.search('^[^a-zA-Z]', " ".join(remainsent.words)):
					if re.search('[a-zA-Z]', " ".join(remainsent.words)):
													
						if sents[remainid-1].words[-1] == "." or not (len(remainsent.words)>=2 and \
							(remainsent.words[-2].lower() in ['sp', 'indet', 'cf', 'u/ia', 'continued'] or \
							re.search('[^a-zA-Z]', remainsent.words[-2].lower()) or \
							len(remainsent.words[-2]) == 1 and re.search('A-Z', remainsent.words[-2]))):
							captions[j].append(remainsent)
							history[remainid] = 1

						else:
							if len(sents[remainid-1].words) > 0 and sents[remainid-1].words[-1] == "?":
								captions[j].append(remainsent)
								history[remainid] = 1
							else:
								remainid = remainid - 1
								break
				else:
					remainid = remainid - 1
					break

			for remainid in range(remainid+1, len(sents)):
				remainsent = sents[remainid]
				if " ".join(remainsent.words).endswith('.'):
					if re.search('[a-zA-Z]', " ".join(remainsent.words)):
						if not (len(remainsent.words) < 3 or len(remainsent.words[-2]) <= 3 or \
							remainsent.words[-2].lower() in ['spp', 'sp', 'indet', 'cf', 'u/ia', 'continued'] or \
							re.search('[^a-zA-Z]', remainsent.words[-2].lower())  or (len(remainsent.words[-2]) == 1)):
							
							nextsent = remainid + 1
							if nextsent >= len(sents): break
							
							if len(" ".join(sents[nextsent].words)) >= 3 and \
								" ".join(sents[nextsent].words).endswith('.') and \
								re.search('[A-Za-z]', " ".join(sents[nextsent].words)):
								break
							
				history[remainid] = 1
				contents[j].append(remainsent)
	
	for j in captions:
		tid = ('TABLE_%d_DOC_' % j) + docid
		for sent in captions[j]:
			print json.dumps({"docid":docid, "tableid":tid, "type":"CAPTION", "sentid":sent.sentid})
		for sent in contents[j]:
			print json.dumps({"docid":docid, "tableid":tid, "type":"CONTENT", "sentid":sent.sentid})













