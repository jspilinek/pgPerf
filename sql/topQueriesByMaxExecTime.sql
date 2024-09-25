\o 'html/topQueriesByMaxExecTime.html'
--Longest max execution time
SELECT   *
FROM     pg_stat_statements 
ORDER BY max_exec_time DESC 
limit 50
\g (format=html)
