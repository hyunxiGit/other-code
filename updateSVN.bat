@echo off

rem set SVN="C:\Program Files\SlikSvn\bin\svn" 
set SVN="C:\Program Files\TortoiseSVN\bin\svn"

rem set Arr[0]=E:\SVN\trunk\client\3rdParty
rem set Arr[1]=E:\SVN\trunk\client\HShield


set Arr[0]=E:\SVN\b_jx3_dev_KG3DEngine_2018-10-16\client
set Arr[1]=E:\SVN\b_jx3_dev_KG3DEngine_2018-10-16\EditorTool
set Arr[2]=E:\SVN\trunk\client
set Arr[3]=E:\SVN\trunk\EditorTool

set "x=0"

:folderLoop
if not defined Arr[%x%] goto :endLoop

:doUpdateCleanup

call echo [log] svn update :%%Arr[%x%]%%
call %SVN% update --non-interactive %%Arr[%x%]%%

IF errorlevel 1 (
	call echo [log] svn cleanup :%%Arr[%x%]%%
	call %SVN% cleanup %%Arr[%x%]%%
	goto :doUpdateCleanup
)

rem call echo [log] svn resolve -- accept theirs:%%Arr[%x%]%%
rem call %SVN% resolve --accept theirs-full %%Arr[%x%]%%

set /a "x+=1"
GOTO :folderLoop

:endLoop
echo "Done"

pause
