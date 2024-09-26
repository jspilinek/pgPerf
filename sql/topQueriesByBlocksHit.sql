\o 'html/output/topQueriesByBlocksHit.html'
--Longest average execution time
SELECT   shared_blks_hit + local_blks_hit AS Blocks_Hit,
*
FROM     pg_stat_statements 
ORDER BY 1 DESC 
limit 50
\g (format=html)
