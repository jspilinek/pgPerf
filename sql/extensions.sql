\o 'html/output/extensions.html'
--List installed extenstions
SELECT pge.extname    AS extension_name,
       pge.extversion AS extension_version,
       pge.extowner   AS extension_owner,
       pgu.usename    AS owner_name,
       pgu.usesuper   AS is_super_user
FROM   pg_extension pge
       JOIN pg_user pgu
         ON pge.extowner = pgu.usesysid
\g (format=html)

