
drop aggregate array_stack_int(integer[]); 

drop aggregate array_stack_text(text[]);

CREATE ORDERED AGGREGATE array_stack_int(integer[]) (
SFUNC = array_cat,
STYPE = integer[]
);

CREATE ORDERED AGGREGATE array_stack_text(text[]) (                           
  SFUNC = array_cat,
  STYPE = text[]
);

ALTER TABLE sentences SET DISTRIBUTED BY (docid);

ALTER TABLE ddtables SET DISTRIBUTED BY (docid);

ALTER TABLE layout_align SET DISTRIBUTED BY (docid);

ALTER TABLE layout_fonts SET DISTRIBUTED BY (docid);

ALTER TABLE entity_formation SET DISTRIBUTED BY (docid);

ALTER TABLE entity_taxon SET DISTRIBUTED BY (docid);

ALTER TABLE entity_location SET DISTRIBUTED BY (docid);

ALTER TABLE entity_temporal SET DISTRIBUTED BY (docid);

ALTER TABLE relation_candidates SET DISTRIBUTED BY (docid);

ALTER TABLE relation_formation SET DISTRIBUTED BY (docid);

ALTER TABLE relation_formationtemporal SET DISTRIBUTED BY (docid);

ALTER TABLE relation_formationlocation SET DISTRIBUTED BY (docid);

ALTER TABLE relation_taxonomy SET DISTRIBUTED BY (docid);

ALTER TABLE relation_formation_global SET DISTRIBUTED BY (docid);

ALTER TABLE relation_formationtemporal_global SET DISTRIBUTED BY (docid);

ALTER TABLE relation_formationlocation_global SET DISTRIBUTED BY (docid);

ALTER TABLE relation_taxonomy_global SET DISTRIBUTED BY (docid);

ALTER TABLE ddtables SET DISTRIBUTED BY (docid);


