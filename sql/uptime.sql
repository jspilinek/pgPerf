\o 'html/uptime.html'
--Server up TIME
SELECT Current_database() 
       AS Current_Database --Current database 
       , 
       current_user
       AS Current_User --Current user 
       , 
       Pg_backend_pid() 
       AS ProcessID --Current user pid 
       , 
       current_timestamp
       ,
       Pg_postmaster_start_time() 
       AS Server_Start_Time --Last start time 
       , 
       current_timestamp :: TIMESTAMP - Pg_postmaster_start_time() :: TIMESTAMP
       AS
       Uptime
\g (format=html)
