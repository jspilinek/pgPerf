\o 'html/connections.html'
SELECT count(1) AS current_connection_count FROM pg_stat_activity
\g (format=html)

SELECT setting AS max_connections FROM pg_settings
WHERE name = 'max_connections'
\g (format=html)

SELECT * FROM pg_stat_activity
\g (format=html)
