\o 'html/output/tables.html'
\qecho <!DOCTYPE html>
\qecho <html>
\qecho    <head>
\qecho        <title>Tables</title>
\qecho        <link rel="stylesheet" type="text/css" href="../static/pgPerf.css"/>
\qecho        <script src="../static/sorttable.js"></script>
\qecho    </head>
\qecho    <body>
\qecho        
\qecho        <h1>Tables</h1>
\qecho        <hr>
\qecho        <br>
\qecho        <a href="../pgPerf.html">Back to main page</a>
\qecho        <br>
\qecho        <!-- [<a href="prevPage.html">Prev</a>] [<a href="nextPage.html">Next</a>] -->
\qecho        <br>
\qecho        <br>
\i sql/sub/:scriptName.sql
\qecho         <br>
\qecho         <!-- <h2>Comments</h2> -->
\qecho         <!-- <p>Insert comments here</p> -->
\qecho         <br>
\qecho         <a href="../pgPerf.html">Back to main page</a>
\qecho         <br>
\qecho         <!-- [<a href="prevPage.html">Prev</a>] [<a href="nextPage.html">Next</a>] -->
\qecho         <br>
\qecho         <!-- <br>
\qecho         <footer></footer> -->
\qecho     </body>
\qecho </html>

\o 'html/output/tables.txt'
SELECT oid,
       table_schema,
       table_name,
       row_estimate,
       Pg_size_pretty(total_bytes) AS total, 
       Pg_size_pretty(index_bytes) AS INDEX, 
       Pg_size_pretty(toast_bytes) AS toast, 
       Pg_size_pretty(table_bytes) AS TABLE
FROM   (SELECT *, 
               total_bytes - index_bytes - COALESCE(toast_bytes, 0) AS
               table_bytes 
        FROM   (SELECT c.oid, 
                       nspname                               AS table_schema, 
                       relname                               AS TABLE_NAME, 
                       c.reltuples                           AS row_estimate, 
                       Pg_total_relation_size(c.oid)         AS total_bytes, 
                       Pg_indexes_size(c.oid)                AS index_bytes, 
                       Pg_total_relation_size(reltoastrelid) AS toast_bytes 
                FROM   pg_class c 
                       LEFT JOIN pg_namespace n 
                              ON n.oid = c.relnamespace 
                WHERE  relkind = 'r') a) a
ORDER BY table_schema ASC, table_name ASC;