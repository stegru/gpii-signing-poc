
:: get cl and mi on the path
if "%WindowsSdkDir%"=="" call "C:\Program Files (x86)\Microsoft Visual Studio\2017\BuildTools\Common7\Tools\VsDevCmd.bat"
::$ENV:PATH += ";C:\Program Files (x86)\Windows Kits\8.1\bin\x86"

del sendmessage.exe *.obj

:: Compile/link
cl SendMessage.c /link /SUBSYSTEM:WINDOWS

:: Add the manifest
mt -manifest app.manifest "-outputresource:SendMessage.exe;#1"

:: sign
powershell -ExecutionPolicy ByPass ./sign.ps1 SendMessage.exe
