\o 'html/output/version.html'
--Postgres version
SELECT Version() AS "Postgres Version"
\g (format=html)
