# pgPerf -- PostgreSQL Performance and Diagnostics Report

# Enable pg_stat_statements
- pg_stat_statements module must be loaded to capture statistics of SQL statements
- To enable pg_stat_statements, add below lines to postgresl.conf
```
shared_preload_libraries = 'pg_stat_statements'
pg_stat_statements.track = top
```
- Restart PostgreSQL
- Create extension, in Codebeamer database execute:
```
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;
```

# Instructions
- Extract contents of pgPerf-##.##.zip
- Change directory to extracted content
- Execute script in psql:

```psql -U <userName> -d <databaseName> -f pgPerf.sql```

Example:
```
psql -U postgres -d codebeamer -f pgPerf.sql
```

- Results are written to html directory
- 00_pgPerf.html is the main file
