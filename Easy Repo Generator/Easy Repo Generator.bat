@echo off
title Easy Repo Generator
color 0a
setlocal enabledelayedexpansion
set Counter=0
set Schalter=2
set Width=0
cls

:home
title Easy Repo Generator - Home
cls
echo 		 ////////////////////////////////////////////
echo 		 //           Easy Repo Generator          //
echo 		 //           Adit Kamath (cydro)          //
echo 		 ////////////////////////////////////////////
echo.
echo.
echo.
echo 1) Generate a Cydia Repo
echo 2) Compress Packages File
echo 3) About
echo 4) Exit
echo.
set input=nothing
set /p main=Option: 
if %main%==1 goto generator
if %main%==2 goto compress
if %main%==3 goto about
if %main%==4 exit
goto error

:generator
title Easy Repo Creator - Generator
cls
echo Generating repo files...
mkdir debs
ping localhost -n 5 >nul
goto release

:release
title Easy Repo Generator - Release Generator
cls
echo Release File
echo.
set input=nothing
set /p or=Origin (what is shown in Sources tab): 
set /p la=Label (what is shown under Package names): 
set /p co=Codename: 
set /p de=Description (keep it short): 
cls
echo Generating Release File...
echo Origin: %or%>Release
echo Label: %la%>>Release
echo Suite: stable>>Release
echo Version: 1.0>>Release
echo Codename: %co%>>Release
echo Architectures: iphoneos-arm>>Release
echo Components: main>>Release
echo Description: %de%>>Release
ping localhost -n 5 >nul
echo.
echo.
echo Release generated^^!
echo.
echo.
title Easy Repo Generator - Packages Generator
echo Generating Packages File...
echo Package: >Packages
echo Name: >>Packages
echo Version: >>Packages
echo Architecture: iphoneos-arm>>Packages
echo Depends: >>Packages
echo Conflicts: >>Packages
echo Description: >>Packages
echo Depiction: >>Packages
echo Homepage: >>Packages
echo Maintainer: >>Packages
echo Author: >>Packages
echo Section: >>Packages
echo Filename: debs//>>Packages
echo Size: >>Packages
echo MD5Sum: >>Packages
ping localhost -n 5 >nul
echo.
echo.
echo Packages generated^^!
echo.
echo.
pause >nul
goto home

:compress
title Easy Repo Generator - Compress
cls
echo Compressing Packages file...
7za a Packages.bz2 Packages>nul
ping localhost -n 5 >nul
echo.
echo.
echo Packages.bz2 generated^^!
echo.
echo.
pause >nul
goto home

:about
cls
echo Created by Adit Kamath (cydro)
echo.
echo Twitter: @cydro_
echo Reddit: /u/aditk96
echo.
pause >nul
goto home

:error
cls
echo That was not an option.
echo.
pause >nul
goto home