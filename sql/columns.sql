\o 'html/output/columns.html'
--Table meta data
SELECT *
FROM   information_schema.columns order by table_name
\g (format=html)

\o 'html/output/columns.txt'
--Table meta data
SELECT *
FROM   information_schema.columns order by table_name;		