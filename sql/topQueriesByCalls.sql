\o 'html/topQueriesByCalls.html'
--SQL statements called most frequently
SELECT   *
FROM     pg_stat_statements 
ORDER BY calls DESC 
limit 50
\g (format=html)
