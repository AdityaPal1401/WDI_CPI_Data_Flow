@echo off

set ORACLE_HOME=C:\Apps\WINDOWS.X64_213000_db_home
set PATH=%PATH%\SRC;%ORACLE_HOME%\bin

set SRC_PATH=E:\Assessment\SRC
set SQL_PATH=E:\Assessment\SQL
set LOG_PATH=E:\Assessment\LOGS

set DB_USERNAME=c##aditya
set DB_PASSWORD=aditya
set DB_NAME=orcl

echo Loading Tables using SQL Loader...
sqlldr %DB_USERNAME%/%DB_PASSWORD%@%DB_NAME% control=%SRC_PATH%\data_loader_wdi.ctl log=%LOG_PATH%\data_loader_wdi.log
sqlldr %DB_USERNAME%/%DB_PASSWORD%@%DB_NAME% control=%SRC_PATH%\data_loader_cpi.ctl log=%LOG_PATH%\data_loader_cpi.log

echo Applying SQL Transformations and Table Creations for loading Indicator data...
sqlplus %DB_USERNAME%/%DB_PASSWORD%@%DB_NAME% @%SQL_PATH%\Indicator_data.sql

echo Waiting for 3 seconds...
timeout /t 3

echo Performing More Transformations and Table Loads for the final data...
sqlplus %DB_USERNAME%/%DB_PASSWORD%@%DB_NAME% @%SQL_PATH%\unpivot_load_final.sql

echo All steps completed.
pause
