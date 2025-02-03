\pset format html
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
    difference DESC;
\pset format aligned
