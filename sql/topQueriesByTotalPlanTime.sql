\o 'html/topQueriesByTotalPlanTime.html'
--SQL statements by total_plan_time
SELECT   *
FROM     pg_stat_statements 
ORDER BY total_plan_time DESC 
limit 50
\g (format=html)
