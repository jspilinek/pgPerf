--Cache Hit Ratio
SELECT 'user tables' as source,
  sum(heap_blks_read) as heap_blks_read,
  sum(heap_blks_hit)  as heap_blks_hit,
  ROUND(sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) * 100,2) as "tables cache hit ratio"
FROM 
  pg_statio_user_tables
UNION SELECT 'all tables' as source,
  sum(heap_blks_read) as heap_blks_read,
  sum(heap_blks_hit)  as heap_blks_hit,
  ROUND(sum(heap_blks_hit) / (sum(heap_blks_hit) + sum(heap_blks_read)) * 100,2) as "tables cache hit ratio"
FROM 
  pg_statio_all_tables
\g (format=html)
