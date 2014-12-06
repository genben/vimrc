@set CURRDIR=%~dp0

mklink "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%CURRDIR%\vimrc"
mklink /D /J "%HOMEDRIVE%%HOMEPATH%\.vim" "%CURRDIR%\vim"
pause