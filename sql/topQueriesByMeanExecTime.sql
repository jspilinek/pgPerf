\o 'html/topQueriesByMeanExecTime.html'
--Longest average execution time
SELECT   *
FROM     pg_stat_statements 
ORDER BY mean_exec_time DESC 
limit 50
\g (format=html)
