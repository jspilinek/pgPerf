\o 'html/output/topQueriesByRows.html'
--SQL statements returning the most rows
SELECT   *
FROM     pg_stat_statements 
ORDER BY rows DESC 
limit 50
\g (format=html)
