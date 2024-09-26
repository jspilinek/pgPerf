\o 'html/invalidIndexes.html'
SELECT n.nspname AS schema,
c.relname AS tablename,
c.relname AS indexname
FROM pg_index i
JOIN pg_class c ON c.oid = i.indrelid
LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE i.indisvalid = false
ORDER BY schema, tablename, indexname
\g (format=html)
