\o 'html/output/indexes.html'
-- All indexes
SELECT
    schemaname AS schemaname,
    t.relname AS tablename,
    ix.relname AS indexname,
    regexp_replace(pg_get_indexdef(i.indexrelid), '^[^\(]*\((.*)\)$', '\1') AS columns,
    regexp_replace(pg_get_indexdef(i.indexrelid), '.* USING ([^ ]*) \(.*', '\1') AS algorithm,
    indisunique AS UNIQUE,
    indisprimary AS PRIMARY,
    indisvalid AS valid,
    pg_size_pretty(pg_relation_size(i.indexrelid)) AS size,
    idx_scan AS indexscans,
    idx_tup_read AS tuplereads,
    idx_tup_fetch AS tuplefetches,
    pg_get_indexdef(i.indexrelid) AS definition
FROM
    pg_index i
    INNER JOIN pg_class t ON t.oid = i.indrelid
    INNER JOIN pg_class ix ON ix.oid = i.indexrelid
    LEFT JOIN pg_stat_user_indexes ui ON ui.indexrelid = i.indexrelid
WHERE
    schemaname IS NOT NULL
ORDER BY
    schemaname ASC,
    tablename ASC,
    indexname ASC
\g (format=html)

\o 'html/output/indexes.txt'
SELECT
    schemaname AS schemaname,
    t.relname AS tablename,
    ix.relname AS indexname,
    regexp_replace(pg_get_indexdef(i.indexrelid), '^[^\(]*\((.*)\)$', '\1') AS columns,
    regexp_replace(pg_get_indexdef(i.indexrelid), '.* USING ([^ ]*) \(.*', '\1') AS algorithm,
    indisunique AS UNIQUE,
    indisprimary AS PRIMARY,
    indisvalid AS valid,
    pg_size_pretty(pg_relation_size(i.indexrelid)) AS size,
    idx_scan AS indexscans,
    idx_tup_read AS tuplereads,
    idx_tup_fetch AS tuplefetches,
    pg_get_indexdef(i.indexrelid) AS definition
FROM
    pg_index i
    INNER JOIN pg_class t ON t.oid = i.indrelid
    INNER JOIN pg_class ix ON ix.oid = i.indexrelid
    LEFT JOIN pg_stat_user_indexes ui ON ui.indexrelid = i.indexrelid
WHERE
    schemaname IS NOT NULL
ORDER BY
    schemaname ASC,
    tablename ASC,
    indexname ASC;