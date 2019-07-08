@ECHO OFF
SETLOCAL

CD %~dp0
SET T=%TEMP%\%RANDOM%

REM Create the parser.
mksvgrmr\bin\Debug\mksvgrmr.exe parser "tmp\SystemVerilog IEEE 1800-2012 Grammar - Sigasi.html" %T%
win_bison --output=NUL --defines=%T%__ %T% 2> %T%_
cscript //nologo add_ignore.js %T% %T%_
cscript //nologo mknames.js %T%__ Utility\names.inl
COPY /B header.y+%T%+footer.y %T%_
CALL :copy_if_newer %T%_ Utility\parser.y
DEL %T%*

REM Create the scanner.
mksvgrmr\bin\Debug\mksvgrmr.exe scanner "tmp\SystemVerilog IEEE 1800-2012 Grammar - Sigasi.html" %T%
COPY /B header.l+%T%+footer.l %T%_
CALL :copy_if_newer %T%_ Utility\scanner.l
DEL %T%

EXIT /B

:copy_if_newer
IF NOT EXIST %2 (
	ECHO Creating %2
	MOVE /Y %1 %2
) ELSE (
	FC %1 %2 > NUL
	IF ERRORLEVEL 1 (
		ECHO Updating %2
		MOVE /Y %1 %2
	) ELSE (
		ECHO No change to %2
		DEL %1
	)
)
