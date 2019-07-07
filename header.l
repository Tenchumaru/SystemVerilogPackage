%option bison-bridge bison-locations
%option noreject noyymore noyywrap
%option noinput nounput
%option noyy_push_state noyy_pop_state noyy_top_state
%option noyyget_extra noyyset_extra noyyget_leng noyyget_text
%option noyyget_lineno noyyset_lineno noyyget_in noyyset_in
%option noyyget_out noyyset_out noyyget_lval noyyset_lval
%option noyyget_lloc noyyset_lloc noyyget_debug noyyset_debug

%{
#include "scanner_d.inl"
%}

ws      [\r\t\v ]+
rem     "//".*
reg     r[1-3]?[0-9]
id      \$?[_A-Za-z][_0-9A-Za-z]*\$?
bin     {num}?'[Ss]?[Bb][_01XZxz]+
dec     {num}?'[Ss]?[Dd][_0-9XZxz]+
hex     {num}?'[Ss]?[Hh][_0-9A-Fa-fXZxz]+
num     [0-9XZxz]+
fix     [0-9]+\.[0-9]+
flt     [0-9]+(\.[0-9]+)?[Ee][+-]?[0-9]+
uul     '[01XZxz]
cid     [a-zA-Z_][a-zA-Z0-9_]*
eid     \\[^\r\t\v ]+
sid     [a-zA-Z_][a-zA-Z0-9_$]*
syd     \$[a-zA-Z0-9_$][a-zA-Z0-9_$]*

%x COMMENT STR BACKTICK

%%
		// This is executed upon entering yylex.
		yylloc_param->first_line = yylloc_param->last_line;
		yylloc_param->first_column = yylloc_param->last_column;

{ws}            { if(is_parsing) SKIP(); else return DBOUT(0, WhiteSpace); }
\n              { if(is_parsing) NL(); else DebugBreak(); }
{rem}           { if(is_parsing) SKIP(); else return DBOUT(0, LineComment); }
"`timescale"    |
"`include"      { if(is_parsing) BEGIN(BACKTICK); else return DBOUT(0, Identifier); }
