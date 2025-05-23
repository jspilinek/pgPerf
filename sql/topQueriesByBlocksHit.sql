\o 'html/output/topQueriesByBlocksHit.html'
\qecho <!DOCTYPE html>
\qecho <html>
\qecho    <head>
\qecho        <title>Top Queries by Blocks Hit</title>
\qecho        <link rel="stylesheet" type="text/css" href="../static/pgPerf.css"/>
\qecho        <script src="../static/sorttable.js"></script>
\qecho    </head>
\qecho    <body>
\qecho        
\qecho        <h1>Top Queries by Blocks Hit</h1>
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


\o 'html/output/topQueriesByBlocksHit.txt'
SELECT roles.rolname AS "user", 
  db.datname AS "database", 
  ss.queryid,
  ss.shared_blks_hit,
  ss.local_blks_hit,
  ss.shared_blks_read,
  ss.calls,
  ss.shared_blks_hit / ss.calls AS "Hits per Call",
  ss.rows / ss.calls AS "Rows per Call",
  substring(replace(replace(replace(ss.query,E'\n',''),E'\r',''),E'\t','') FROM 1 FOR 64) AS "query substring 64"
FROM pg_stat_statements ss
JOIN pg_roles roles ON roles.oid = ss.userid
JOIN pg_database db ON db.oid = ss.dbid
WHERE ss.shared_blks_hit > 1000
ORDER BY ss.shared_blks_hit DESC
limit 50
;

--Full output
SELECT *
FROM  pg_stat_statements ss
WHERE ss.shared_blks_hit > 1000
ORDER BY ss.shared_blks_hit DESC
limit 50
;
