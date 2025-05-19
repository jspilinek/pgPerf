\pset format html
select relname, reloptions
from pg_class
join pg_namespace on pg_namespace.oid = pg_class.relnamespace
where  pg_namespace.nspname = 'public'
order by 1 ;
\pset format aligned
