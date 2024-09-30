SELECT *
FROM   information_schema.columns 
order by table_catalog ASC, table_schema ASC, table_name ASC, column_name ASC
\g (format=html)
