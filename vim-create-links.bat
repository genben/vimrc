@set CURRDIR=%~dp0

mklink "%HOMEDRIVE%%HOMEPATH%\.vimrc" "%CURRDIR%\vimrc"
mklink "%HOMEDRIVE%%HOMEPATH%\.ideavimrc" "%CURRDIR%\.ideavimrc"
mklink /D /J "%HOMEDRIVE%%HOMEPATH%\.vim" "%CURRDIR%\vim"
copy /-Y "%CURRDIR%\.vsvimrc" "%HOMEDRIVE%%HOMEPATH%\.vsvimrc" 
pause