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


CREATE TABLE entity_formation (id bigint, docid text, type text, eid text, entity text, prov text[]);

CREATE TABLE entity_taxon (id bigint, docid text, type text, eid text, entity text, author_year text, prov text[]);

CREATE TABLE entity_location (id bigint, docid text, type text, eid text, entity text, prov text[]);

CREATE TABLE entity_temporal (id bigint, docid text, type text, eid text, entity text, prov text[]);

CREATE TABLE relation_candidates (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, features text);

CREATE TABLE relation_formation (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formationtemporal (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_formationlocation (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);

CREATE TABLE relation_taxonomy (id bigint, docid text, type text, eid1 text, eid2 text, entity1 text, entity2 text, is_correct boolean);