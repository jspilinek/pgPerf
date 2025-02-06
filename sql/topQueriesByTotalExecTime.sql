\o 'html/output/topQueriesByTotalExecTime.html'
\qecho <!DOCTYPE html>
\qecho <html>
\qecho    <head>
\qecho        <title>Top Queries by Total Execution Time</title>
\qecho        <link rel="stylesheet" type="text/css" href="../static/pgPerf.css"/>
\qecho        <script src="../static/sorttable.js"></script>
\qecho    </head>
\qecho    <body>
\qecho        
\qecho        <h1>Top Queries by Total Execution Time</h1>
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

\o 'html/output/topQueriesByTotalExecTime.txt'

-- Longest cumulative time
DO $$
DECLARE
    version_num int;
    query text;
BEGIN
    SELECT current_setting('server_version_num')::int INTO version_num;

    IF version_num >= 130000 THEN
        query := '
        SELECT auth.rolname AS "user", 
          db.datname AS "database", 
          ss.queryid,
          ss.calls,
          round(cast(ss.total_exec_time/1000 AS numeric),3) AS "total_exec_time [sec]",
          round(cast(ss.mean_exec_time/1000 AS numeric),3) AS "mean_exec_time [sec]",
          round(cast(ss.max_exec_time/1000 AS numeric),3) AS "max_exec_time [sec]",
          round(cast(ss.min_exec_time/1000 AS numeric),3) AS "min_exec_time [sec]",
          ss.rows,
          substring(replace(replace(replace(ss.query,E''\n'',''''),E''\r'',''''),E''\t'','''') FROM 1 FOR 64) AS "query substring 64"
        FROM pg_stat_statements ss
        JOIN pg_authid auth ON auth.oid = ss.userid
        JOIN pg_database db ON db.oid = ss.dbid
        WHERE ss.total_exec_time > 1 -- 1 ms
        ORDER BY total_exec_time DESC
        limit 50;
        ';
    ELSE
        query := '
        SELECT auth.rolname AS "user", 
          db.datname AS "database", 
          ss.queryid,
          ss.calls,
          round(cast(ss.total_time/1000 AS numeric),3) AS "total_exec_time [sec]",
          round(cast(ss.mean_time/1000 AS numeric),3) AS "mean_exec_time [sec]",
          round(cast(ss.max_time/1000 AS numeric),3) AS "max_exec_time [sec]",
          round(cast(ss.min_time/1000 AS numeric),3) AS "min_exec_time [sec]",
          ss.rows,
          substring(replace(replace(replace(ss.query,E''\n'',''''),E''\r'',''''),E''\t'','''') FROM 1 FOR 64) AS "query substring 64"
        FROM pg_stat_statements ss
        JOIN pg_authid auth ON auth.oid = ss.userid
        JOIN pg_database db ON db.oid = ss.dbid
        WHERE ss.total_time > 1 -- 1 ms
        ORDER BY total_time DESC
        limit 50;
        ';
    END IF;

    EXECUTE query;
END $$;

-- Full output
DO $$
DECLARE
    version_num int;
    query text;
BEGIN
    SELECT current_setting('server_version_num')::int INTO version_num;

    IF version_num >= 130000 THEN
        query := '
        SELECT *
        FROM pg_stat_statements 
        WHERE total_exec_time > 1 -- 1 ms
        ORDER BY total_exec_time DESC
        limit 50;
        ';
    ELSE
        query := '
        SELECT *
        FROM pg_stat_statements 
        WHERE total_time > 1 -- 1 ms
        ORDER BY total_time DESC
        limit 50;
        ';
    END IF;

    EXECUTE query;
END $$;
\pset format aligned