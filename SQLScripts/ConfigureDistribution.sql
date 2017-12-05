/****** Scripting replication configuration. Script Date: 11/21/2017 4:55:08 PM ******/
/****** Please Note: For security reasons, all password parameters were scripted with either NULL or an empty string. ******/

/****** Installing the server as a Distributor. Script Date: 11/21/2017 4:55:08 PM ******/
use master
exec sp_adddistributor @distributor = N'SQLSatSlovenia', @password = N''
GO
exec sp_adddistributiondb @database = N'distribution', @data_folder = N'F:\Data', @log_folder = N'F:\Log', @log_file_size = 2, @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @security_mode = 1
GO

use [distribution] 
if (not exists (select * from sysobjects where name = 'UIProperties' and type = 'U ')) 
	create table UIProperties(id int) 
if (exists (select * from ::fn_listextendedproperty('SnapshotFolder', 'user', 'dbo', 'table', 'UIProperties', null, null))) 
	EXEC sp_updateextendedproperty N'SnapshotFolder', N'\\SQLSatSlovenia\repl', 'user', dbo, 'table', 'UIProperties' 
else 
	EXEC sp_addextendedproperty N'SnapshotFolder', N'\\SQLSatSlovenia\repl', 'user', dbo, 'table', 'UIProperties'
GO

exec sp_adddistpublisher @publisher = N'SQLSatSlovenia', @distribution_db = N'distribution', @security_mode = 1, @working_directory = N'\\SQLSatSlovenia\repl', @trusted = N'false', @thirdparty_flag = 0, @publisher_type = N'MSSQLSERVER'
GO
