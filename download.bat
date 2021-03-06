@ECHO off
title Download Office 2019

IF EXIST temp RMDIR /s /q temp
MKDIR temp
IF NOT EXIST %~dp0\oitpinstall MKDIR %~dp0\oitpinstall
IF NOT EXIST %~dp0\dllog MKDIR %~dp0\dllog

:init
ECHO ^<Configuration^> > %~dp0\dl_configure.xml
ECHO. >> %~dp0\dl_configure.xml
ECHO ^<Add SourcePath="%CD%\oitpinstall\" OfficeClientEdition="32" ^> >> %~dp0\dl_configure.xml
ECHO     ^<Product ID="ProPlus2019Retail"^> >> %~dp0\dl_configure.xml
ECHO	    ^<Language ID="zh-tw" /^> >> %~dp0\dl_configure.xml
ECHO     ^</Product^> >> %~dp0\dl_configure.xml
ECHO   ^</Add^> >> %~dp0\dl_configure.xml
ECHO. >> %~dp0\dl_configure.xml
ECHO ^<Logging Name="OfficeDL.txt" Path="%~dp0\dllog\" /^> >> %~dp0\dl_configure.xml
ECHO. >> %~dp0\dl_configure.xml
ECHO ^</Configuration^> >> %~dp0\dl_configure.xml

:begin
CLS
SET INPUT=
ECHO ===========OFFICE UPDATE=============
SET /P INPUT=Press Y to Download newest office, N to cancel.
ECHO.
ECHO.
IF /I '%INPUT%'=='Y' GOTO download
IF /I '%INPUT%'=='N' GOTO End2

:download
CLS
ECHO =========DOWNLOADING OFFICE==========
setup.exe /download %~dp0\dl_configure.xml
goto end1

:End1
RMDIR /s /q temp
CLS
ECHO =========DOWNLOAD COMPLETED==========
ECHO.
Pause
Exit

:End2
RMDIR /s /q temp
CLS
ECHO =========DOWNLOAD CANCELED===========
ECHO.
Pause
Exit