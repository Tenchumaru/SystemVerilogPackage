@ECHO OFF
SETLOCAL

SET D=%~dp0
SET PARSER="%~dp0Utility\parser.y"
SET T=%TEMP%\%RANDOM%
mksvgrmr\bin\Debug\mksvgrmr.exe "tmp\SystemVerilog IEEE 1800-2012 Grammar - Sigasi.html" %PARSER%
win_bison --output=%T%x %PARSER% 2> %T%
cscript //nologo add_ignore.js %PARSER% %T%
COPY "%~dp0header.y"+%PARSER%+"%~dp0footer.y" %T%
MOVE /Y %T% %PARSER%
DEL %T%x
