# Introduction
This scripts automates the connection and loging to a FTP server from a windows machine using MSDOS scripting language.
It basically creates a temporal file with the necessary FTP commands and then uses that file as input to be run by the standard FTP client against a defined FTP server. FTP scripts allow you to put together a chain of commands in a file that you can call when needed.

# Configuration
The configuration is embedded in the script.

Parameters you can update are located in the "configuration" section:

```console
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
set local_dir_old=C:\Local-FTP\OLD\

rem file to store ftp commands, log and errors
set ftpauto_tmp=ftpauto.tmp
set ftpauto_log=%local_dir%\ftpauto.log
set ftpauto_err=%local_dir%\ftpauto.err

rem ---------- Configuration End ----------

```

Where we have this parameters to edit if necessary:

<ul>
  <li>server: Remote FTP server name or IP</li>
  <li>password: FTP Password</li>
  <li>remote_dir: Remote folder where file is located</li>
  <li>remote_file: Remote filename to be downloaded</li>
  <li>local_dir: Local folder where the remote file will be downloaded.</li>
  <li>local_dir_old: Local folder where a copy of existing file will be saved with a timestamp at the end of its filename.</li>
  <li>ftpauto_tmp: Filename for the temporary ftp script file that needs to be created to perform the required ftp commands on the remote server.</li>
  <li>ftpauto_log: Filename with log information.</li>
  <li>ftpauto_err: Filename with errors.</li>
</ul>

# Install
Just download the *.bat file and edit the *configuration section*.

# Just run it !
Open a msdos terminal and type the script name to launch it. You can also double click on the *.bat script file.

![Windows desktop](./images/windows.png) Script file on the Windows desktop
