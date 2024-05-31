::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFBVWTReLMG6GIrof/eX+4f6UnnI0WvQ6dpvUyPSqJfYW5kr0eJMjwkZ7jd8DCB5LdVKiYBkxp3pNpCqMNMj8
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFBVWTReLMG6GIrof/eX+4f6UnnI0WvQ6dpvUyPSqJfYW5kr0eJMjwkZzlt0JAg9XbFKKagt0hmAClXGXJcKSpzPIRFud50c8J0x6kWbemCQpX/JsnuwNwG675Eif
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983

cls
@echo off
@pushd %~dp0
set mypath=%cd%
tasklist /FI "IMAGENAME eq Inventor.exe" 2>NUL | find /I /N "Inventor.exe" >NUL
if "%ERRORLEVEL%"=="0" (
goto END
)
:PROMPT

SET /P AREYOUSURE=This will overwrite the VBA and iLogic files. Are you sure (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO EXT
SET "CHK=TRUE"

IF exist "%PUBLIC%\Documents\Autodesk\Inventor 2021\" (
   xcopy /s /f /y /i /r "%mypath%\VBA Macros" "%PUBLIC%\Documents\Autodesk\Inventor 2021\Macros\" >NUL || SET "CHK=False"
   xcopy /s /f /y /i /r "%mypath%\iLogicOptions" "%USERPROFILE%\AppData\Roaming\Autodesk\Inventor 2021\iLogicPreferences\" >NUL || SET "CHK=False"
   xcopy /s /f /y /i /r "%mypath%\RibbonButtons" "%USERPROFILE%\AppData\Roaming\Autodesk\Inventor 2021\" >NUL || SET "CHK=False"
   xcopy /s /f /y /i /r "%mypath%\ExternalRules" "%PUBLIC%\Documents\Autodesk\Inventor 2021\Design Data\iLogic\" >NUL || SET "CHK=False"
   xcopy /s /f /y /i /r "%mypath%\UI" "%PUBLIC%\Documents\Autodesk\Inventor 2021\Design Data\iLogic\UI\" >NUL || SET "CHK=False"
   IF NOT errorlevel 0 GOTO FAIL
   IF %CHK% == FALSE GOTO FAIL
) 



IF "%CHK%" == "TRUE" (
  echo File Transfer Complete
  pause
  @popd	
  exit 
) ELSE (
echo Could not locate the installation folder for Inventor.  
pause
exit
)

:FAIL
echo
echo Error transferring files
pause
@popd
exit

:END
echo. 
echo Inventor is open, please close before install.
pause
@popd
exit

:EXT 
echo. 
echo Exiting...
timeout /t 4
@popd
exit