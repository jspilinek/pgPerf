\o 'html/output/objectSizes.html'
--Database object Sizes
SELECT nspname                                        AS schemaname, 
       cl.relname                                     AS objectname, 
       CASE relkind 
         WHEN 'r' THEN 'table'
         WHEN 'i' THEN 'index'
         WHEN 'S' THEN 'sequence'
         WHEN 'v' THEN 'view'
         WHEN 'm' THEN 'materialized view'
         ELSE 'other'
       end                                            AS type, 
       s.n_live_tup                                   AS total_rows, 
       Pg_size_pretty(Pg_total_relation_size(cl.oid)) AS size
FROM   pg_class cl 
       LEFT JOIN pg_namespace n 
              ON ( n.oid = cl.relnamespace ) 
       LEFT JOIN pg_stat_user_tables s 
              ON ( s.relid = cl.oid ) 
WHERE  nspname NOT IN ( 'pg_catalog', 'information_schema' ) 
       AND cl.relkind <> 'i'
       AND nspname !~ '^pg_toast'
ORDER  BY Pg_total_relation_size(cl.oid) DESC
\g (format=html)
