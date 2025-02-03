\pset format html
SELECT state as "process_state", count(*) 
FROM pg_stat_activity 
GROUP BY state;

SELECT setting AS max_connections FROM pg_settings
WHERE name = 'max_connections';

select datname, usename, client_addr, count(*) 
from pg_stat_activity 
group by datname, usename, client_addr 
order by count(*) desc;


SELECT * FROM pg_stat_activity
ORDER BY query_start ASC;
\pset format aligned
