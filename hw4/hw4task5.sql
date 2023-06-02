create or replace view v_used_size_per_user
            (
             table_owner, schema_name, table_name, table_size, used_per_schema_user_total_size, used_user_total_size
                )
as
select tableowner,
       schemaname,
       tablename,
       pg_size_pretty(pg_relation_size(concat(schemaname, '.', tablename))),
       pg_size_pretty(sum(pg_relation_size(concat(schemaname, '.', tablename))) over
           (partition by tableowner, schemaname)),
       pg_size_pretty(sum(pg_relation_size(concat(schemaname, '.', tablename))) over
           (partition by tableowner))
from pg_catalog.pg_tables;
