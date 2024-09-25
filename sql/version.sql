\o 'html/version.html'
--Postgres version
SELECT Version()          AS "Postgres Version", 
        Inet_server_addr() AS "Server IP", 
       setting            AS "Port Number"
FROM   pg_settings 
WHERE  name = 'port'
\g (format=html)
