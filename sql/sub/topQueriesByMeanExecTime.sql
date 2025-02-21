\pset format html
--Longest average execution time
SELECT roles.rolname AS "user", 
  db.datname AS "database", 
  ss.queryid,
  ss.calls,
  round(cast(ss.total_exec_time/1000 AS numeric),3) AS "total_exec_time [sec]",
  round(cast(ss.mean_exec_time/1000 AS numeric),3) AS "mean_exec_time [sec]",
  round(cast(ss.max_exec_time/1000 AS numeric),3) AS "max_exec_time [sec]",
  round(cast(ss.min_exec_time/1000 AS numeric),3) AS "min_exec_time [sec]",
  ss.rows,
  substring(replace(replace(replace(ss.query,E'\n',''),E'\r',''),E'\t','') FROM 1 FOR 64) AS "query substring 64"
FROM pg_stat_statements ss
JOIN pg_roles roles ON roles.oid = ss.userid
JOIN pg_database db ON db.oid = ss.dbid
WHERE ss.mean_exec_time > 1 -- 1 ms
ORDER BY mean_exec_time DESC
limit 50
\g (format=html)

--Full output
SELECT *
FROM  pg_stat_statements 
WHERE mean_exec_time > 1 -- 1 ms
ORDER BY mean_exec_time DESC
limit 50
\pset format aligned