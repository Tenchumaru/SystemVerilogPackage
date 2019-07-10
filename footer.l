"."             { return DBOUT(*yytext, Operator); }
"/*"            { BEGIN(COMMENT); }
\"              { BEGIN(STR); }
.               { return DBOUT(*yytext, Delimiter); }

<COMMENT>{
"*/"        { if(is_parsing) { SKIP(); BEGIN(INITIAL); } else return SELECT(0, Comment); }
[^*\n]+     |
"*"         if(is_parsing) SKIP();
\n          { if(is_parsing) NL(); else DebugBreak(); }
<<EOF>>     { BEGIN(INITIAL); return SELECT(0, Comment); }
}

<STR>{
\n          { if(is_parsing) { NL(); BEGIN(INITIAL); return DBOUT(STRING, String); } else DebugBreak(); }
\"          { BEGIN(INITIAL); return DBOUT(STRING, String); }
\\[0-9]+    |
\\.         |
[^\\\n\"]+  ;
<<EOF>>     { BEGIN(INITIAL); return DBOUT(STRING, String); }
}

<BACKTICK>{
[^\n]+      if(is_parsing) SKIP();
\n          { if(is_parsing) { NL(); BEGIN(INITIAL); } else DebugBreak(); }
}

%%

#include "scanner_u.inl"
