-- Example command:
-- psql -U postgres -d codebeamer -f pgPerf.sql

--Uncomment below line for timing displayed in console
--\timing on

\pset tableattr class=sortable

-- Check PostgreSQL version and set column names
DO $$
DECLARE
    version_num int;
BEGIN
    SELECT current_setting('server_version_num')::int INTO version_num;

    IF version_num >= 130000 THEN
        PERFORM set_config('exec_time_column', 'total_exec_time', false);
        PERFORM set_config('mean_time_column', 'mean_exec_time', false);
        PERFORM set_config('max_time_column', 'max_exec_time', false);
        PERFORM set_config('min_time_column', 'min_exec_time', false);
    ELSE
        PERFORM set_config('exec_time_column', 'total_time', false);
        PERFORM set_config('mean_time_column', 'mean_time', false);
        PERFORM set_config('max_time_column', 'max_time', false);
        PERFORM set_config('min_time_column', 'min_time', false);
    END IF;
END $$;

--Column 1
\set scriptName version             \i sql/00_scriptLauncher.sql
\set scriptName uptime              \i sql/00_scriptLauncher.sql
\set scriptName settings            \i sql/00_scriptLauncher.sql
\set scriptName extensions          \i sql/00_scriptLauncher.sql
\set scriptName activity            \i sql/00_scriptLauncher.sql

--Column 2
\set scriptName databaseStats       \i sql/00_scriptLauncher.sql
\set scriptName databaseSizes       \i sql/00_scriptLauncher.sql
\set scriptName objectSizes         \i sql/00_scriptLauncher.sql
\set scriptName tables              \i sql/00_scriptLauncher.sql
\set scriptName deadTuples          \i sql/00_scriptLauncher.sql
\set scriptName columns             \i sql/00_scriptLauncher.sql


--Column 3
\set scriptName indexes             \i sql/00_scriptLauncher.sql
\set scriptName indexStats          \i sql/00_scriptLauncher.sql
\set scriptName missingIndexes      \i sql/00_scriptLauncher.sql
\set scriptName invalidIndexes      \i sql/00_scriptLauncher.sql
\set scriptName cacheHitRatio       \i sql/00_scriptLauncher.sql
\set scriptName tableCacheHitRatio  \i sql/00_scriptLauncher.sql
\set scriptName indexCacheHitRatio  \i sql/00_scriptLauncher.sql
\set scriptName statistics          \i sql/00_scriptLauncher.sql


--Column 4
\set scriptName topQueriesByTotalExecTime   \i sql/00_scriptLauncher.sql
\set scriptName topQueriesByMeanExecTime    \i sql/00_scriptLauncher.sql
\set scriptName topQueriesByBlocksHit       \i sql/00_scriptLauncher.sql
\set scriptName topQueriesByBlocksRead      \i sql/00_scriptLauncher.sql
\set scriptName topQueriesByCalls           \i sql/00_scriptLauncher.sql
\set scriptName topQueriesByRows            \i sql/00_scriptLauncher.sql
\set scriptName topQueriesByTotalPlanTime   \i sql/00_scriptLauncher.sql

\echo Done
