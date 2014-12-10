rd /S /Q %1
mkdir %1
ECHO F | xcopy %2\Latch\dist\LatchSigned.apk %1\Latch.apk /Y
call %7\d2j-dex2jar.bat -f -o %1\newjar.jar %1\Latch.apk
call %7\d2j-jar2jasmin.bat -f -o %1\jasmincode %1\newjar.jar
xcopy %3 %1\jasmincode /S /Y
call copyAutoPluguin.bat %4 %5 %1 %7
call RepackLatch.bat %1 %7
@echo off
echo to do
echo      add %1\classes.dex to %1\newLatch.apk
pause
@echo on
call SignLatch.bat %1 %7
call InstallLatch.bat %1 %6