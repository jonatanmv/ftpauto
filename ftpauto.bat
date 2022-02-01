@echo START

@echo off

rem Version: 20120327
rem Description: MSDOS Script to automatically download a file from FTP server

rem ---------- Configuration Start ----------

rem FTP server parameters
set server=your-server.com
set username=anonymous
set password=anonymous

rem Remote folder and filename to download
set remote_dir=/pub/
set remote_file=datafile.txt

rem Local folder where the remote file will be downloaded
set local_dir=C:\Local-DIR

rem local folder to save old versions of the file
set local_dir_old=C:\Local-DIR\OLD\

rem file to store ftp commands, log and errors
set ftpauto_tmp=ftpauto.tmp
set ftpauto_log=%local_dir%\ftpauto.log
set ftpauto_err=%local_dir%\ftpauto.err

rem ---------- Configuration End ----------

for /f "tokens=2,3,4 delims=./ " %%a in ('date /t') do (
   set y=%%c
   set m=%%b
   set d=%%a
)

for /f "tokens=1,2 delims=:, " %%A in ('time /t') do (
   set hh=%%A
   set mm=%%B
)

set timestamp2=%y%-%m%-%d%
set timestamp=%y%-%m%-%d%_%hh%%mm%

echo %username%>> %ftpauto_tmp%
echo %password%>> %ftpauto_tmp%
echo >> %ftpauto_tmp%
echo lcd %local_dir% >> %ftpauto_tmp%
echo bin >> %ftpauto_tmp%
echo get %remote_dir%%remote_file% >> %ftpauto_tmp%
echo quit >> %ftpauto_tmp%

echo >>%ftpauto_log%
echo __________________________________________________________>> %ftpauto_log%
echo __________________________________________________________>> %ftpauto_err%
echo %timestamp% // FTP script started>>%ftpauto_log%
echo %timestamp% // FTP script started>>%ftpauto_err%

copy /Y %local_dir%\%remote_file% %local_dir_old%\%remote_file%_%timestamp%

ftp -s:%ftpauto_tmp% %server% 1>>%ftpauto_log% 2>>%ftpauto_err%
echo %timestamp% // FTP script finished>>%ftpauto_log%
echo %timestamp% // FTP script finished>>%ftpauto_err%
del %ftpauto_tmp%

echo on
@echo END
