\o 'html/columns.html'
--Table meta data
SELECT *
FROM   information_schema.columns order by table_name
\g (format=html)

\o 'html/columns.txt'
--Table meta data
SELECT *
FROM   information_schema.columns order by table_name;		