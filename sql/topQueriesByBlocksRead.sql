\o 'html/output/topQueriesByBlocksRead.html'
--Longest average execution time
SELECT   shared_blks_read + local_blks_read + temp_blks_read AS Blocks_Read,
*
FROM     pg_stat_statements 
ORDER BY 1 DESC 
limit 50
\g (format=html)
