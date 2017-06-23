@echo off

rem don't modify the caller's environment
setlocal

rem Set up prog to be the path of this script, including following symlinks,
rem and set up progdir to be the fully-qualified pathname of its directory.
set prog=%~f0

rem Change current directory and drive to where the script is, to avoid
rem issues with directories containing whitespaces.
cd /d %~dp0

rem Add default jre6 path
set PATH=%~dp0..\jre7\bin;%PATH%

rem Check we have a valid Java.exe in the path.
set java_exe=%~dp0..\jre7\bin\java.exe
if not exist "%java_exe%" (call tools\lib\find_java.bat)
if not defined java_exe goto :EOF

set jarfile=MIUINewThemeEditor.jar
set frameworkdir=
set libdir=

set jarpath=%frameworkdir%%jarfile%
echo %java_exe%
call "%java_exe%" -Djava.ext.dirs="%frameworkdir%" -Xmx1024M -jar "%jarpath%" %*
