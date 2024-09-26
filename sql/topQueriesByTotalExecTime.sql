\o 'html/output/topQueriesByTotalExecTime.html'
--Longest cumultive time
SELECT   *
FROM     pg_stat_statements 
ORDER BY total_exec_time DESC
limit 50
\g (format=html)
