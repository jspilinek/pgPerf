\o 'html/cacheHitRatio.html'

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



--Index Cache Hit Ratio
SELECT 'user tables' as source,
  sum(idx_blks_read) as idx_blks_read,
  sum(idx_blks_hit)  as idx_blks_hit,
  ROUND(sum(idx_blks_hit) / (sum(idx_blks_hit) + sum(idx_blks_read)) * 100,2) as "index cache hit ratio"
FROM 
  pg_statio_user_tables
UNION SELECT 'all tables' as source,
  sum(idx_blks_read) as idx_blks_read,
  sum(idx_blks_hit)  as idx_blks_hit,
  ROUND(sum(idx_blks_hit) / (sum(idx_blks_hit) + sum(idx_blks_read)) * 100,2) as "index cache hit ratio"
FROM 
  pg_statio_all_tables
\g (format=html)

--TOAST table Cache Hit Ratio
SELECT 'user tables' as source,
  sum(toast_blks_read) as toast_blks_read,
  sum(toast_blks_hit)  as toast_blks_hit,
  ROUND(sum(toast_blks_hit) / (sum(toast_blks_hit) + sum(toast_blks_read)) * 100,2) as "toast cache hit ratio"
FROM 
  pg_statio_user_tables
UNION SELECT 'all tables' as source,
  sum(toast_blks_read) as toast_blks_read,
  sum(toast_blks_hit)  as toast_blks_hit,
  ROUND(sum(toast_blks_hit) / (sum(toast_blks_hit) + sum(toast_blks_read)) * 100,2) as "toast cache hit ratio"
FROM 
  pg_statio_all_tables
\g (format=html)

--TOAST table indexes Cache Hit Ratio
SELECT 'user tables' as source,
  sum(tidx_blks_read) as tidx_blks_read,
  sum(tidx_blks_hit)  as tidx_blks_hit,
  ROUND(sum(tidx_blks_hit) / (sum(tidx_blks_hit) + sum(tidx_blks_read)) * 100,2) as "tidx cache hit ratio"
FROM 
  pg_statio_user_tables
UNION SELECT 'all tables' as source,
  sum(tidx_blks_read) as tidx_blks_read,
  sum(tidx_blks_hit)  as tidx_blks_hit,
  ROUND(sum(tidx_blks_hit) / (sum(tidx_blks_hit) + sum(tidx_blks_read)) * 100,2) as "tidx cache hit ratio"
FROM 
  pg_statio_all_tables
\g (format=html)