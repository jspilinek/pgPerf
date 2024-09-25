\o 'html/databaseSizes.html'
--Sizes
SELECT Pg_size_pretty(Sum(Pg_database_size(datname))) AS total_database_size
FROM   pg_database
\g (format=html)

 
SELECT Pg_size_pretty(Sum(size)) AS total_WAL_size
FROM   Pg_ls_waldir()
\g (format=html)


SELECT
    pg_database.datname AS database_name,
    pg_size_pretty(pg_database_size(pg_database.datname)) AS size
FROM
    pg_database
\g (format=html)

	
SELECT Current_database(), 
       Pg_size_pretty(Pg_database_size(Current_database()))
\g (format=html)

