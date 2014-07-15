create aggregate array_stack_text(text[])
(
  sfunc=array_cat,
  stype=text[]
);

create aggregate array_stack_int(int[])
(
  sfunc=array_cat,
  stype=int[]
);

CREATE AGGREGATE array_agg_mult(anyarray) (
    SFUNC = array_cat,
    STYPE = anyarray,
    INITCOND = '{}'
);


CREATE TABLE entity_formation (id bigint, docid text, type text, eid text, entity text, prov text[], is_correct boolean);

CREATE TABLE entity_taxon (id bigint, docid text, type text, eid text, entity text, author_year text, prov text[], is_correct boolean);

CREATE TABLE entity_location (id bigint, docid text, type text, eid text, entity text, prov text[], is_correct boolean);

CREATE TABLE entity_temporal (id bigint, docid text, type text, eid text, entity text, prov text[], is_correct boolean);

CREATE TABLE relation_candidates (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, features text);

CREATE TABLE relation_formation (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formationtemporal (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formationlocation (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_taxonomy (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formation_global (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formationtemporal_global (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formationlocation_global (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_taxonomy_global (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE ddtables (id bigint, docid text, tableid text, type text, sentid text);

CREATE TABLE interval_containments (id bigint, formation text, child text, parent text);

CREATE TABLE interval_not_that_possible(id bigint, formation text, interval1 text, interval2 text);