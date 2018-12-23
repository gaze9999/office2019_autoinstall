@ECHO off
title Installing Office 2019

IF NOT EXIST %~dp0\oitpinstall MKDIR %~dp0\oitpinstall

:begin
CLS
SET INPUT=
ECHO ===========OFFICE UPDATE=============
SET /P INPUT=Press Y to Download newest office, N to cancel.
ECHO.
ECHO.
IF /I '%INPUT%'=='Y' GOTO download
IF /I '%INPUT%'=='N' ( 
GOTO End2
)

:download
CLS
ECHO =========DOWNLOADING OFFICE==========
CALL Setup.exe /download Configuration.xml
goto end1

:End1
CLS
ECHO =========DOWNLOAD COMPLETED==========
ECHO.
Pause
Exit

:End2
CLS
ECHO =========DOWNLOAD CANCELED===========
ECHO.
Pause
Exit