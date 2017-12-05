-----------------BEGIN: Script to be run at Publisher 'SQLSATSLOVENIA'-----------------
use [eadl365db]
exec sp_addsubscription @publication = N'EAD_DB', @subscriber = N'azuredbsrv.database.windows.net', @destination_db = N'eadl365db', @subscription_type = N'Push', @sync_type = N'automatic', @article = N'all', @update_mode = N'read only', @subscriber_type = 0
exec sp_addpushsubscription_agent @publication = N'EAD_DB', @subscriber = N'azuredbsrv.database.windows.net', @subscriber_db = N'eadl365db', @job_login = null, @job_password = null, @subscriber_security_mode = 0, @subscriber_login = N'repl_agent', @subscriber_password = null, @frequency_type = 64, @frequency_interval = 0, @frequency_relative_interval = 0, @frequency_recurrence_factor = 0, @frequency_subday = 0, @frequency_subday_interval = 0, @active_start_time_of_day = 0, @active_end_time_of_day = 235959, @active_start_date = 20171121, @active_end_date = 99991231, @enabled_for_syncmgr = N'False', @dts_package_location = N'Distributor'
GO
-----------------END: Script to be run at Publisher 'SQLSATSLOVENIA'-----------------

