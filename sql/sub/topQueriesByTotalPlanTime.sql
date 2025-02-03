\pset format html
--SQL statements by total_plan_time
SELECT auth.rolname AS "user", 
  db.datname AS "database", 
  ss.queryid,
  ss.calls,
  ss.total_plan_time,
  ss.plans,
  substring(replace(replace(replace(ss.query,E'\n',''),E'\r',''),E'\t','') FROM 1 FOR 64) AS "query substring 64"
FROM pg_stat_statements ss
JOIN pg_authid auth ON auth.oid = ss.userid
JOIN pg_database db ON db.oid = ss.dbid
WHERE ss.total_plan_time > 1 -- 1 ms
ORDER BY ss.total_plan_time DESC
limit 50;

--Full output
SELECT *
FROM  pg_stat_statements ss
WHERE ss.total_plan_time > 1 -- 1 ms
ORDER BY ss.total_plan_time DESC
limit 50;
\pset format aligned
