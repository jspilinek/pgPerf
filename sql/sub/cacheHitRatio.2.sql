\pset format html
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
  pg_statio_all_tables;
\pset format aligned
