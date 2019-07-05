!IF "$(Configuration)" == "Debug"
CPPFLAGS=-nologo -D_DEBUG -W4 -WX -Od -Zc:wchar_t -Zc:forScope -ZI -EHsc -MDd -LDd
!ELSEIF "$(Configuration)" == "Release"
CPPFLAGS=-nologo -DNDEBUG -W4 -WX -O2 -Zc:wchar_t -Zc:forScope -EHsc -MD -LD
!ELSE
!ERROR Configuration not given.
!ENDIF

all: ..\SystemVerilogPackage\bin\$(Configuration)\Utility.dll

..\SystemVerilogPackage\bin\$(Configuration)\Utility.dll: $(Configuration)\parser.obj $(Configuration)\scanner.obj $(Configuration)\exports.obj
	cl $(CPPFLAGS) -Fe$@ $** User32.lib
	COPY /Y $@ %USERPROFILE%\AppData\Local\Microsoft\VisualStudio\12.0Exp\Extensions\Adrezdi\SystemVerilogPackage\1.0
	COPY /Y $*.pdb %USERPROFILE%\AppData\Local\Microsoft\VisualStudio\12.0Exp\Extensions\Adrezdi\SystemVerilogPackage\1.0
	
$(Configuration)\parser.obj: parser.cpp exports.h scanner.h parser_p.inl parser_e.inl
	cl $(CPPFLAGS) -c -Fo$@ parser.cpp -Fd$(Configuration)\vc100.pdb

$(Configuration)\scanner.obj: scanner.cpp exports.h parser.h scanner_d.inl scanner_u.inl
	cl $(CPPFLAGS) -c -Fo$@ scanner.cpp -Fd$(Configuration)\vc100.pdb

$(Configuration)\exports.obj: exports.cpp exports.h keywords.h
	cl $(CPPFLAGS) -c -Fo$@ exports.cpp -Fd$(Configuration)\vc100.pdb -D_SCL_SECURE_NO_WARNINGS
	
parser.cpp parser.h: parser.y
	win_bison --verbose --defines=parser.h --output=parser.cpp parser.y

scanner.cpp scanner.h: scanner.l
	win_flex --batch --fast --reentrant --wincompat --header-file=scanner.h --outfile=scanner.cpp scanner.l

clean:
	IF EXIST $(Configuration) DEL /F /Q $(Configuration)
	IF EXIST scanner.cpp DEL /F /Q scanner.cpp
	IF EXIST scanner.h DEL /F /Q scanner.h
	IF EXIST parser.cpp DEL /F /Q parser.cpp
	IF EXIST parser.h DEL /F /Q parser.h
