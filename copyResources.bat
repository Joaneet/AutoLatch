rd /S /Q %1\Latch
cd %1
call %5 d Latch.apk
xcopy %2 %1\Latch\res /S /Y
xcopy %3 %1\Latch\AndroidManifest.xml /Y
call %5 b Latch
call %4\d2j-apk-sign.bat -f -o %1\Latch\dist\LatchSigned.apk %1\Latch\dist\Latch.apk