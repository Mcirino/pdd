
/**
 * Input resources. `sentences` is Bazaar's result. `ddtables` is the 
 * detected tables by either Abby or our custom script. 
 */
//sentences(docid text, sentid text, wordidxs text[], words text[], poses text[], ners text[], lemmas text[], dep_paths text[], dep_parents text[], bounding_boxes text[]).

/*
 docid       | text      |           | extended |              | 
 sentid      | integer   |           | plain    |              | 
 wordindex   | integer[] |           | extended |              | 
 words       | text[]    |           | extended |              | 
 poses       | text[]    |           | extended |              | 
 ners        | text[]    |           | extended |              | 
 lemmas      | text[]    |           | extended |              | 
 dep_paths   | text[]    |           | extended |              | 
 dep_parents | text[]    |           | extended |              | 
 font        | text[]    |           | extended |              | 
 layout      | text[]    |           | extended |              | 
*/

sentences(
	docid text,
	sentid text,
	wordindex text[],
	words text[],
	poses text[],
	ners text[],
	lemmas text[],
	dep_paths text[],
	dep_parents text[],
	font text[],
	layout text[]).

ddtables (docid text, tableid text, type text, sentid text).

/**
 * Transform input resources into a form that ddlib can understand.
 * These tables hold essentially the same info as `sentences` table,
 * but are aggregated or serialized in different ways.
 **/
sentences_serialized(docid text, sentid text, wordidxs text, words text, poses text, ners text, lemmas text, dep_paths text, dep_parents text, font text, layout text).

documents(docid text, sentids text[], wordidxs text[], words text[], poses text[], ners text[], lemmas text[], dep_paths text[], dep_parents text[], font text[], layout text[]).

documents_serialized(docid text, sentids text, wordidxs text, words text, poses text, ners text, lemmas text, dep_paths text, dep_parents text, font text, layout text).


/**
 * Entity candidates that can be discovered from a single sentence (therefore, "local").
 **/
entity_formation_candidate_local (docid text, type text, eid text, entity text, prov text).

entity_taxon_candidate_local (docid text, type text, eid text, entity text, author_year text, prov text).

/**
 * Entity candidates that discovered from a whole document. To discover them, we might need
 * the local result. 
 **/
entity_formation_candidate (docid text, type text, eid text, entity text, prov text).

entity_taxon_candidate (docid text, type text, eid text, entity text, author_year text, prov text).

entity_location_candidate (docid text, type text, eid text, entity text, prov text).

entity_temporal_candidate (docid text, type text, eid text, entity text, prov text).

all_entity_candidate(docid text, type text, eid text, entity text, prov text).

/**
 * Aggregated entity candidates per documents (with or without document contents). 
 * (Used to generated relation candidates)
 **/
formation_per_doc(docid text, entity text[], type text[]).

taxon_per_doc(docid text, entity text[], type text[]).

all_entity_per_doc(docid text, eid text[], entity text[], type text[], prov text[]).

document_with_formation_entities(docid text, entities text, types text, sentids text, wordidxs text, words text, poses text, ners text, lemmas text, dep_paths text, dep_parents text, font text, layout text).

document_with_taxon_entities(docid text, entities text, types text, sentids text, wordidxs text, words text, poses text, ners text, lemmas text, dep_paths text, dep_parents text, font text, layout text).

document_with_all_entities(docid text, entities text, types text, eids text, provs text, sentids text, wordidxs text, words text, poses text, ners text, lemmas text, dep_paths text, dep_parents text, font text, layout text).


/**
 * Relation candidates (with features)
 **/
relation_candidates (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, features text).

/**
 * Entity variables.
 **/
entity_formation? (docid text, type text, eid text, entity text, prov text).

entity_taxon? (docid text, type text, eid text, entity text, author_year text, prov text).

entity_location? (docid text, type text, eid text, entity text, prov text).

entity_temporal? (docid text, type text, eid text, entity text, prov text).

/**
 * Relation variables from each document. The "_supervise" holds the supervision data for
 * each relation.
 **/
relation_formation? (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text).

relation_formationtemporal? (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text).

relation_formationlocation? (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text).

relation_taxonomy? (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text).

relation_formation_supervise (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, label boolean).

relation_formationtemporal_supervise (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, label boolean).

relation_formationlocation_supervise (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, label boolean).

relation_taxonomy_supervise (docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, label boolean).


/**
 * Relation variables from ALL documents (therefore, "global").
 **/
relation_formation_global? (type text, entity1 text, entity2 text).

relation_formationtemporal_global? (type text, entity1 text, entity2 text).

relation_formationlocation_global? (type text, entity1 text, entity2 text).

relation_taxonomy_global? (type text, entity1 text, entity2 text).

/**
 * Auxiliary table about intervals according to their containment and distance.
 **/
interval_containments (formation text, child text, parent text).

interval_not_that_possible(formation text, interval1 text, interval2 text).


/***
 * The following three rules aim at preparing a serialized version of the 
 * sentence and document from the `sentences` table output by Bazaar. If 
 * ddlog could support array as first-class citizen, the following three rules 
 * could be further simplified. However, for now, we use a way that is similar 
 * to MapReduce/Hadoop to represent tuple as string with user-defined separator. 
 * Words are separated by @@@@@, and sentences are separated by |||||.
 *
 * Two relations that will be used later by other rules are `sentences_serialized` 
 * and `documents_serialized`. ddlib contains functions to deserialize these two 
 * tables into python object.
 * 
 * NOTE: These three rules only rely on the output of Bazaar, so it could be reused by
 * different applications as long as it uses Bazaar to produce the output. 
 *
 * NOTE: The ddlib deserialization function acts as the intermediate layer to decouple user
 * program with Bazaar and the following three serialization rules. Even when Bazaar gets
 * changed or the following three rules are changed, as long as the ddlib's deserialization
 * function does not change, the user does not need to change their Python function
 * at all. This type of decoupling is one of the key goals as of the refactoring of July 2015.
 *
 ***/

// Each word in sentence is separated with @@@@@
sentences_serialized(
	docid, 
	sentid, 
	array_to_string(wordidxs, "@@@@@"), 
	array_to_string(words, "@@@@@"), 
	array_to_string(poses, "@@@@@"), 
	array_to_string(ners, "@@@@@"), 
	array_to_string(lemmas, "@@@@@"), 
	array_to_string(dep_paths, "@@@@@"), 
	array_to_string(dep_parents, "@@@@@"), 
	array_to_string(font, "@@@@@"),
	array_to_string(layout, "@@@@@")) *
	:- sentences(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout).

// Intermidate table to generate `documents_serialized`.
documents(
	docid,
	ARRAY_AGG(sentid),
	ARRAY_AGG(wordidxs), 
	ARRAY_AGG(words), 
	ARRAY_AGG(poses),
	ARRAY_AGG(ners), 
	ARRAY_AGG(lemmas), 
	ARRAY_AGG(dep_paths),
	ARRAY_AGG(dep_parents), 
	ARRAY_AGG(font),
	ARRAY_AGG(layout)) *
	:- sentences_serialized(docid, sentid, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout).


// Each sentence is separated with |||||, Each word in sentence is separated with @@@@@
documents_serialized(
	docid,
	array_to_string(sentids, "|||||"),
	array_to_string(wordidxs, "|||||"),
	array_to_string(words, "|||||"),
	array_to_string(poses, "|||||"),
	array_to_string(ners, "|||||"),
	array_to_string(lemmas, "|||||"),
	array_to_string(dep_paths, "|||||"),
	array_to_string(dep_parents, "|||||"),
	array_to_string(font, "|||||"),
	array_to_string(layout, "|||||")) 
	:- documents(docid, sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout).

/**
 * Entities that can be decided by only looking at the sentence itself.
 * We call these local entities.
 **/
function ext_entity_formation_local over like sentences_serialized
                 returns like entity_formation
  implementation "/udf/ext_formation_local.py" handles tsv lines.
entity_formation_candidate_local :- !ext_entity_formation_local(sentences_serialized).

function ext_entity_temporal_local over like sentences_serialized
                 returns like entity_temporal
  implementation "/udf/ext_temporal_local.py" handles tsv lines.
entity_temporal_candidate :- !ext_entity_temporal_local(sentences_serialized).

function ext_entity_taxon_local over like sentences_serialized
                 returns like entity_taxon
  implementation "/udf/ext_taxon_local.py" handles tsv lines.
entity_taxon_candidate_local :- !ext_entity_taxon_local(sentences_serialized).

/**
 * Aggregate local entities into global ones.
 **/
formation_per_doc(docid, ARRAY_AGG(entity), ARRAY_AGG(type)) :-
    entity_formation_candidate_local(docid, type, eid, entity, prov).

taxon_per_doc(docid, ARRAY_AGG(entity), ARRAY_AGG(type)) :-
	entity_taxon_candidate_local(docid, type, eid, entity, author_year, prov).


/**
 * Extract entities from the whole document using the local version.
 **/
function ext_entity_formation_global over like document_with_formation_entities
				  returns like entity_formation
  implementation "/udf/ext_formation_global.py" handles tsv lines.

document_with_formation_entities(docid, 
  array_to_string(entities, "@@@@@"),
  array_to_string(types, "@@@@@"),
  sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout) 
:-
  formation_per_doc(docid, entities, types),
  documents_serialized(docid, sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout).

entity_formation_candidate :- !ext_entity_formation_global(document_with_formation_entities).
entity_formation_candidate(docid, type, eid, entity, prov) :-
	entity_formation_candidate_local(docid, type, eid, entity, prov).



function ext_entity_taxon_global over like document_with_taxon_entities
				  returns like entity_taxon
  implementation "/udf/ext_taxon_global.py" handles tsv lines.

document_with_taxon_entities(docid, 
  array_to_string(entities, "@@@@@"),
  array_to_string(types, "@@@@@"),
  sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout) 
:-
  taxon_per_doc(docid, entities, types),
  documents_serialized(docid, sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout).

entity_taxon_candidate :- !ext_entity_taxon_global(document_with_taxon_entities).
entity_taxon_candidate(docid, type, eid, entity, author_year, prov) :-
	entity_taxon_candidate_local(docid, type, eid, entity, author_year, prov).

function ext_entity_location_global over like documents_serialized
				  returns like entity_location
  implementation "/udf/ext_location_global.py" handles tsv lines.

entity_location_candidate :- !ext_entity_location_global(documents_serialized).
	
/**
 * Put all entity candidate together.
 **/
all_entity_candidate(docid, "FORMATION", eid, entity, prov) :-
	entity_formation_candidate(docid, type, eid, entity, prov).

all_entity_candidate(docid, "INTERVAL", eid, entity, prov) :-
	entity_temporal_candidate(docid, type, eid, entity, prov).

all_entity_candidate(docid, "TAXON-" || type, eid, entity, prov) :-
	entity_taxon_candidate(docid, type, eid, entity, author_yaer, prov).

all_entity_candidate(docid, "LOCATION", eid, entity, prov) :-
	entity_location_candidate(docid, type, eid, entity, prov).

all_entity_per_doc(docid, ARRAY_AGG(eid), ARRAY_AGG(entity), ARRAY_AGG(type), ARRAY_AGG(prov)) :-
	all_entity_candidate(docid, type, eid, entity, prov).

document_with_all_entities(docid,
  array_to_string(entities, "@@@@@"),
  array_to_string(types, "@@@@@"),
  array_to_string(eids, "@@@@@"),
  array_to_string(provs, "@@@@@"),
  sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout)
:-
  all_entity_per_doc(docid, eids, entities, types, provs),
  documents_serialized(docid, sentids, wordidxs, words, poses, ners, lemmas, dep_paths, dep_parents, font, layout).

/**
 * Extract features for relation extractor -- same sentence.
 **/
function ext_relation_same_sent over like document_with_all_entities
				 returns like relation_candidates
  implementation "/udf/ext_relation_samesent.py" handles tsv lines.

relation_candidates :- !ext_relation_same_sent(document_with_all_entities).

function ext_relation_sectionheader over like document_with_all_entities
				 returns like relation_candidates
  implementation "/udf/ext_relation_sectionheader.py" handles tsv lines.

relation_candidates :- !ext_relation_sectionheader(document_with_all_entities).

/**
 * Supervision Rule for Relations.
 **/
function ext_relation_variable_formationtemporal over like relation_candidates
				 returns like relation_formationtemporal_supervise
  implementation "/udf/supervise_formationtemporal.py" handles tsv lines.
relation_formationtemporal_supervise :- !ext_relation_variable_formationtemporal(relation_candidates).

function ext_relation_variable_taxonomy over like relation_candidates
				 returns like relation_taxonomy_supervise
  implementation "/udf/supervise_taxonomy.py" handles tsv lines.
relation_taxonomy_supervise :- !ext_relation_variable_taxonomy(relation_candidates).

function ext_relation_variable_formation over like relation_candidates
				 returns like relation_formation_supervise
  implementation "/udf/supervise_formation.py" handles tsv lines.
relation_formation_supervise :- !ext_relation_variable_formation(relation_candidates).

relation_formation(docid, type, eid1, eid2, entity1, entity2) :-
	relation_formation_supervise(docid, type, eid1, eid2, entity1, entity2, l) label = l.

relation_taxonomy(docid, type, eid1, eid2, entity1, entity2) :-
	relation_taxonomy_supervise(docid, type, eid1, eid2, entity1, entity2, l) label = l.

relation_formationtemporal(docid, type, eid1, eid2, entity1, entity2) :-
	relation_formationtemporal_supervise(docid, type, eid1, eid2, entity1, entity2, l) label = l.

relation_formationlocation(docid, type, eid1, eid2, entity1, entity2) :-
	relation_formationlocation_supervise(docid, type, eid1, eid2, entity1, entity2, l) label = l.


/**
 * Inference Rule for Relations.
 *
 **/
relation_formation(docid, type, eid1, eid2, entity1, entity2) :-
	relation_candidates(docid, "FORMATION", eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.

relation_formationtemporal(docid, type, eid1, eid2, entity1, entity2) :-
	relation_candidates(docid, "FORMATIONINTERVAL", eid1, eid2, entity1, entity2, feature),
	entity_formation(docid, t1, eid1, entity1, prov1),
	entity_temporal(docid, t2, eid2, entity2, prov2)
	weight = feature
	semantics = Imply.

relation_formationlocation(docid, type, eid1, eid2, entity1, entity2) :-
	relation_candidates(docid, "FORMATIONLOCATION", eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.

relation_taxonomy(docid, type, eid1, eid2, entity1, entity2) :-
	relation_candidates(docid, "TAXONOMY", eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.


/**
 * Global relations by aggregating relations extracted from each document.
 **/
relation_formation_global(type, eid1, eid2) * :-
	relation_formation(docid, type, eid1, eid2, entity1, entity2).

relation_formationtemporal_global(type, eid1, eid2) * :-
	relation_formationtemporal(docid, type, eid1, eid2, entity1, entity2).

relation_formationlocation_global(type, eid1, eid2) * :-
	relation_formationlocation(docid, type, eid1, eid2, entity1, entity2).

relation_taxonomy_global(type, eid1, eid2) * :-
	relation_taxonomy(docid, type, eid1, eid2, entity1, entity2).

relation_formation_global(type, eid1, eid2) :-
	relation_formation(docid, type, eid1, eid2, entity1, entity2),
	relation_candidates(docid, type2, eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.

relation_formationtemporal_global(type, eid1, eid2) :-
	relation_formationtemporal(docid, type, eid1, eid2, entity1, entity2),
	relation_candidates(docid, type2, eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.

relation_formationlocation_global(type, eid1, eid2) :-
	relation_formationlocation(docid, type, eid1, eid2, entity1, entity2),
	relation_candidates(docid, type2, eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.

relation_taxonomy_global(type, eid1, eid2) :-
	relation_taxonomy(docid, type, eid1, eid2, entity1, entity2),
	relation_candidates(docid, type2, eid1, eid2, entity1, entity2, feature)
	weight = feature
	semantics = Imply.


/**
 * Inference rules for entities.
 **/
entity_formation(docid, type, eid, entity, prov) :- 
	entity_formation_candidate(docid, type, eid, entity, prov).

entity_temporal(docid, type, eid, entity, prov) :-
  entity_temporal_candidate(docid, type, eid, entity, prov).

entity_location(docid, type, eid, entity, prov) :-
  entity_location_candidate(docid, type, eid, entity, prov).

entity_taxon(docid, type, eid, entity, author_year, prov) :-
  entity_taxon_candidate(docid, type, eid, entity, author_year, prov).

entity_formation(docid, type, eid, entity, prov) :-
  entity_formation_candidate(docid, type, eid, entity, prov)
  weight = type
  semantics = Imply.

entity_temporal(docid, type, eid, entity, prov) :-
  entity_temporal_candidate(docid, type, eid, entity, prov)
  weight = type
  semantics = Imply.

entity_location(docid, type, eid, entity, prov) :-
  entity_location_candidate(docid, type, eid, entity, prov)
  weight = type
  semantics = Imply.

entity_taxon(docid, type, eid, entity, author_year, prov) :-
  entity_taxon_candidate(docid, type, eid, entity, author_year, prov)
  weight = type
  semantics = Imply.








