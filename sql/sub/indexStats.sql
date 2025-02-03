\pset format html
SELECT t.tablename, 
       indexname, 
       c.reltuples AS num_rows, 
       Pg_size_pretty(Pg_relation_size(Quote_ident(t.tablename) :: text))  AS table_size, 
       Pg_size_pretty(Pg_relation_size(Quote_ident(indexrelname) :: text)) AS index_size, 
       idx_scan AS number_of_scans, 
       idx_tup_read AS tuples_read, 
       idx_tup_fetch AS tuples_fetched 
FROM   pg_tables t 
       left outer join pg_class c 
                    ON t.tablename = c.relname 
       left outer join (SELECT c.relname   AS ctablename, 
                               ipg.relname AS indexname, 
                               x.indnatts  AS number_of_columns, 
                               idx_scan, 
                               idx_tup_read, 
                               idx_tup_fetch, 
                               indexrelname, 
                               indisunique 
                        FROM   pg_index x 
                               join pg_class c 
                                 ON c.oid = x.indrelid 
                               join pg_class ipg 
                                 ON ipg.oid = x.indexrelid 
                               join pg_stat_all_indexes psai 
                                 ON x.indexrelid = psai.indexrelid) AS foo 
                    ON t.tablename = foo.ctablename 
WHERE t.schemaname = 'public'
ORDER BY tablename, indexname;
\pset format aligned
