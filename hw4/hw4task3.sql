create or replace view v_first_level_partition_info (parent_schema, parent_table, child_schema, child_table) as
select pn2.nspname,
       pc2.relname,
       pn1.nspname,
       pic1.relname
from (((pg_inherits pi1 join pg_class pc1 on pi1.inhrelid = pc1.oid) pic1
    join
    pg_class pc2 on pic1.inhparent = pc2.oid)
    join pg_namespace pn1 on pic1.relnamespace = pn1.oid)
         join pg_namespace pn2 on pc2.relnamespace = pn2.oid;
