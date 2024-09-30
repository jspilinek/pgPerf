SELECT relname AS "relation",
    idx_blks_read AS index_read, 
    idx_blks_hit AS index_hit,
    COALESCE((( idx_blks_hit * 100 ) / NULLIF(( idx_blks_hit + idx_blks_read ), 0)),0) AS ratio
FROM pg_statio_user_indexes
    ORDER BY ratio DESC
\g (format=html)
