\pset format html
-- Longest cumulative time
SELECT auth.rolname AS "user", 
  db.datname AS "database", 
  ss.queryid,
  ss.calls,
  round(cast(ss.current_setting('exec_time_column')::text/1000 AS numeric),3) AS "total_exec_time [sec]",
  round(cast(ss.current_setting('mean_time_column')::text/1000 AS numeric),3) AS "mean_exec_time [sec]",
  round(cast(ss.current_setting('max_time_column')::text/1000 AS numeric),3) AS "max_exec_time [sec]",
  round(cast(ss.current_setting('min_time_column')::text/1000 AS numeric),3) AS "min_exec_time [sec]",
  ss.rows,
  substring(replace(replace(replace(ss.query,E'\n',''),E'\r',''),E'\t','') FROM 1 FOR 64) AS "query substring 64"
FROM pg_stat_statements ss
JOIN pg_authid auth ON auth.oid = ss.userid
JOIN pg_database db ON db.oid = ss.dbid
WHERE ss.current_setting('exec_time_column')::text > 1 -- 1 ms
ORDER BY ss.current_setting('exec_time_column')::text DESC
limit 50;

-- Full output
SELECT *
FROM  pg_stat_statements ss
WHERE ss.current_setting('exec_time_column')::text > 1 -- 1 ms
ORDER BY ss.current_setting('exec_time_column')::text DESC
limit 50;
\pset format aligned
