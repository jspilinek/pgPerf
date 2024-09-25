\o 'html/missingIndexes.html'
--maybe-missing indexes?
-- See on which tables PG is doing a lot of sequential scans. On small tables
-- a seq scan is more efficient than an index scan so always think if adding
-- an index would really make sense.
-- Sadly, it does not show which fields are "hot", only the tables names.
SELECT
    relname as table,
    pg_size_pretty(pg_relation_size(relid::regclass)) AS size,
    seq_scan as sequential_scans,
    idx_scan as index_scans,
    seq_scan - idx_scan AS difference,
    CASE WHEN seq_scan - idx_scan > 0 THEN
        'Missing Index?'
    ELSE
        'OK'
    END AS status
FROM
    pg_stat_all_tables
WHERE
    schemaname = 'public'
    AND pg_relation_size(relid::regclass) > 80000
ORDER BY
    difference DESC
\g (format=html)
