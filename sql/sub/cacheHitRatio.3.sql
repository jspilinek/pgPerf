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
