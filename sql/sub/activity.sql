SELECT state as "process_state", count(*) 
FROM pg_stat_activity 
GROUP BY state
\g (format=html)

SELECT setting AS max_connections FROM pg_settings
WHERE name = 'max_connections'
\g (format=html)

select datname, usename, client_addr, count(*) 
from pg_stat_activity 
group by datname, usename, client_addr 
order by count(*) desc
\g (format=html)

SELECT * FROM pg_stat_activity
ORDER BY query_start ASC
\g (format=html)
