@echo off
:menu
cls
echo Select an option:
echo 1. Empty the Recycle Bin
echo 2. Delete a folder
echo 3. Exit
set /p choice=Enter your choice (1/2/3): 

if %choice%==1 goto empty_bin
if %choice%==2 goto delete_folder
if %choice%==3 goto exit

:empty_bin
echo Emptying Recycle Bin...
powershell -command "Clear-RecycleBin -Force"
echo Recycle Bin has been emptied.
pause
goto menu

:delete_folder
set /p folderpath=Enter the folder path to delete: 
if not exist "%folderpath%" (
    echo The folder does not exist.
    pause
    goto menu
)
echo Deleting the folder: %folderpath%
rmdir /S /Q "%folderpath%"
echo Folder has been deleted.
pause
goto menu

:exit
echo Goodbye!
pause
exit
