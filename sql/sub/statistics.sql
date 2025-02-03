\pset format html
SELECT 
c.relname,
a.attname,
s.staattnum,
s.stadistinct,
s.stanullfrac,
s.stawidth
FROM pg_statistic s
JOIN pg_class c ON c.oid = s.starelid
JOIN pg_attribute a ON a.attnum = s.staattnum AND a.attrelid = c.oid
ORDER BY c.relname ASC, a.attname ASC;
\pset format aligned
