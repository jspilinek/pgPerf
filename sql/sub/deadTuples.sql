\pset format html
SELECT schemaname, relname AS tablename, n_live_tup AS "live_tuples", n_dead_tup AS "dead_tuples",
round(CAST((float4(n_dead_tup)/float4(n_live_tup + n_dead_tup))*100 as numeric),2) as percent_dead_tuples, 
last_vacuum, last_autovacuum, last_analyze, last_autoanalyze,
n_tup_ins as "inserts",n_tup_upd as "updates",n_tup_del as "deletes", 
(n_tup_ins + n_tup_upd + n_tup_del) as "total_activity"
FROM pg_stat_all_tables 
WHERE (n_live_tup + n_dead_tup) > 0
ORDER BY "dead_tuples" DESC;
\pset format aligned
