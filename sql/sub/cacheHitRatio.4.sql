\pset format html
--TOAST table indexes Cache Hit Ratio
SELECT 'user tables' as source,
  sum(tidx_blks_read) as tidx_blks_read,
  sum(tidx_blks_hit)  as tidx_blks_hit,
  CASE 
    WHEN (sum(tidx_blks_hit) + sum(tidx_blks_read)) = 0 THEN 0
    ELSE ROUND(sum(tidx_blks_hit) / (sum(tidx_blks_hit) + sum(tidx_blks_read)) * 100, 2)
  END as "tidx cache hit ratio"
FROM 
  pg_statio_user_tables
UNION 
SELECT 'all tables' as source,
  sum(tidx_blks_read) as tidx_blks_read,
  sum(tidx_blks_hit)  as tidx_blks_hit,
  CASE 
    WHEN (sum(tidx_blks_hit) + sum(tidx_blks_read)) = 0 THEN 0
    ELSE ROUND(sum(tidx_blks_hit) / (sum(tidx_blks_hit) + sum(tidx_blks_read)) * 100, 2)
  END as "tidx cache hit ratio"
FROM 
  pg_statio_all_tables;
\pset format aligned