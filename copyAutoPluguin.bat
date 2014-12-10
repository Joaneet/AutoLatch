rd /Q /S %1
mkdir %1
ECHO F | xcopy %2 %1\AutoLatchPluguin.apk /Y
call %4\d2j-dex2jar.bat -f -o %1\newjar.jar %1\AutoLatchPluguin.apk
call %4\d2j-jar2jasmin.bat -f -o %1\jasmin %1\newjar.jar
xcopy %1\jasmin\com %3\jasmincode\com /S /Y