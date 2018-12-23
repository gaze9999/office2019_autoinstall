@echo off
title Installing Office 2019

IF EXIST %TEMP%\oitplog RMDIR /s /q %TEMP%\oitplog
MKDIR %TEMP%\oitplog

:install
ECHO ^<Configuration^> > %CD%\oitp_configure.xml
ECHO. >> %TEMP%\oitp\oitp_configure.xml
ECHO ^<Add SourcePath="%CD%\oitpinstall\" OfficeClientEdition="32" ^> >> %CD%\oitp_configure.xml
ECHO     ^<Product ID="Standard2019Volume"^> >> %CD%\oitp_configure.xml
ECHO        ^<Language ID="zh-tw" /^> >> %CD%\oitp_configure.xml
ECHO		^<ExcludeApp ID="Groove" /^> >> %CD%\oitp_configure.xml
ECHO        ^<ExcludeApp ID="OneNote" /^> >> %CD%\oitp_configure.xml
ECHO     ^</Product^> >> %CD%\oitp_configure.xml
ECHO   ^</Add^> >> %CD%\oitp_configure.xml
ECHO. >> %CD%\oitp_configure.xml
ECHO ^<Property Name="SharedComputerLicensing" Value="0" /^> >> %CD%\oitp_configure.xml
ECHO ^<Property Name="PinIconsToTaskbar" Value="TRUE" /^> >> %CD%\oitp_configure.xml
ECHO ^<Property Name="SCLCacheOverride" Value="0" /^> >> %CD%\oitp_configure.xml
ECHO ^<Updates Enabled="TRUE" /^> >> %CD%\oitp_configure.xml
ECHO ^<RemoveMSI All="TRUE" /^> >> %CD%\oitp_configure.xml
ECHO ^<Display Level="None" AcceptEULA="FALSE" /^> >> %CD%\oitp_configure.xml
ECHO ^<Logging Name="OfficeSetup.txt" Path="%TEMP%\oitplog\" /^> >> %CD%\oitp_configure.xml
ECHO. >> %TEMP%\oitp\oitp_configure.xml
ECHO ^</Configuration^> >> %CD%\oitp_configure.xml
CLS

ECHO ==========INSTALLING OFFICE==========
@PING 127.0.0.1 -n 5 -w 1000 > NUL
CALL %CD%\Setup.exe /configure %CD%\oitp_configure.xml
@PING 127.0.0.1 -n 5 -w 1000 > NUL
goto complete

:complete
del /F /S %CD%\oitp_configure.xml
CLS
ECHO ==========INSTALL COMPELTE===========
ECHO -------------------------------------
ECHO ========PRESS ANY KEY TO EXIT========
Pause>null
Exit