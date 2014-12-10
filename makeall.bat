@echo off 
set OriginalApkDir=c:\AutoLatchPlugin\newLatch
set AutoLatchPluguinDir=c:\AutoLatchPlugin\AutoLatchPluguin
set AutoLatchPluguinTempDir=c:\AutoLatchPlugin\AutoLatchPluguinTemp
set newManifest=c:\AutoLatchPlugin\newLatch\AndroidManifestMod.xml
set dex2jarToolsDir=f:\downloads\dex2jar-0.0.9.15\dex2jar-0.0.9.15
set newLatchDir=c:\AutoLatchPlugin\final
set ModjasminCodeDir=c:\AutoLatchPlugin\latchMOD\jasmincode
set AutoLatchPluguinAPK=c:\AutoLatchPlugin\AutoLatchPluguin\bin\AutoLatchPluguin.apk
set adbExe=c:\android\adt-bundle-windows-x86_64-20130917\sdk\platform-tools\adb
set apktoolBat=apktoot.bat
@echo on

call copyResources.bat %OriginalApkDir% %AutoLatchPluguinDir%\res %newManifest% %dex2jarToolsDir% %apktoolBat%
call MakeLatchMod.bat %newLatchDir% %OriginalApkDir% %ModjasminCodeDir% %AutoLatchPluguinTempDir% %AutoLatchPluguinAPK% %adbExe% %dex2jarToolsDir%