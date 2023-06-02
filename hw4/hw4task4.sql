create or replace view new_v_first_level_partition_info (parent_schema, parent_table, child_schema, child_table, part_level) as
select pn2.nspname,
       pc2.relname,
       pn1.nspname,
       pic1.relname,
       1
from (((pg_inherits pi1 join pg_class pc1 on pi1.inhrelid = pc1.oid) pic1
    join
    pg_class pc2 on pic1.inhparent = pc2.oid)
    join pg_namespace pn1 on pic1.relnamespace = pn1.oid)
         join pg_namespace pn2 on pc2.relnamespace = pn2.oid;

create or replace recursive view v_rec_level_partition_info (parent_schema, parent_table, child_schema, child_table, part_level) as
select *
from new_v_first_level_partition_info
union all
select v.parent_schema,
       v.parent_table,
       v1.child_schema,
       v1.child_table,
       v.part_level + 1
from v_rec_level_partition_info v
         join new_v_first_level_partition_info v1 on v.child_table = v1.parent_table and v.child_schema = v1.parent_schema;
