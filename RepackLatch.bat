call %2\d2j-jasmin2jar.bat -f -o %1\repack.jar %1\jasmincode
call %2\d2j-asm-verify.bat %1\repack.jar
call %2\d2j-jar2dex.bat -f -o  %1\classes.dex %1\repack.jar
ECHO F | xcopy %1\Latch.apk %1\newLatch.apk /Y
