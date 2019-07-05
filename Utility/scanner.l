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
num     [0-9XZxz]+
bin     {num}?'[Ss]?[Bb][_01XZxz]+
dec     {num}?'[Ss]?[Dd][_0-9XZxz]+
hex     {num}?'[Ss]?[Hh][_0-9A-Fa-fXZxz]+
zoo     {num}?'[01]

%x COMMENT STR BACKTICK

%%
		// This is executed upon entering yylex.
		yylloc_param->first_line = yylloc_param->last_line;
		yylloc_param->first_column = yylloc_param->last_column;

{ws}            { if(is_parsing) SKIP(); else return DBOUT(0, WhiteSpace); }
\n              { if(is_parsing) NL(); else DebugBreak(); }
{rem}           { if(is_parsing) SKIP(); else return DBOUT(0, LineComment); }
{bin}           |
{dec}           |
{hex}           |
{num}           |
{zoo}           { return DBOUT(VALUE, Literal); }
"`timescale"    |
"`include"      { if(is_parsing) BEGIN(BACKTICK); else return DBOUT(0, Identifier); }
always_latch    { return DBOUT(ALWAYS_LATCH, Identifier); }
endinterface    { return DBOUT(ENDINTERFACE, Identifier); }
always_comb     { return DBOUT(ALWAYS_COMB, Identifier); }
endfunction     { return DBOUT(ENDFUNCTION, Identifier); }
endgenerate     { return DBOUT(ENDGENERATE, Identifier); }
always_ff       { return DBOUT(ALWAYS_FF, Identifier); }
endmodule       { return DBOUT(ENDMODULE, Identifier); }
interface       { return DBOUT(INTERFACE, Identifier); }
parameter       { return DBOUT(PARAMETER, Identifier); }
function        { return DBOUT(FUNCTION, Identifier); }
generate        { return DBOUT(GENERATE, Identifier); }
unsigned        { return DBOUT(UNSIGNED, Identifier); }
default         { return DBOUT(DEFAULT, Identifier); }
endcase         { return DBOUT(ENDCASE, Identifier); }
initial         { return DBOUT(INITIAL_, Identifier); }
integer         { return DBOUT(INTEGER, Identifier); }
modport         { return DBOUT(MODPORT, Identifier); }
negedge         { return DBOUT(NEGEDGE, Identifier); }
posedge         { return DBOUT(POSEDGE, Identifier); }
typedef         { return DBOUT(TYPEDEF, Identifier); }
always          { return DBOUT(ALWAYS, Identifier); }
assign          { return DBOUT(ASSIGN, Identifier); }
genvar          { return DBOUT(GENVAR, Identifier); }
module          { return DBOUT(MODULE, Identifier); }
output          { return DBOUT(OUTPUT, Identifier); }
return          { return DBOUT(RETURN, Identifier); }
begin           { return DBOUT(BEGIN_, Identifier); }
inout           { return DBOUT(INOUT, Identifier); }
input           { return DBOUT(INPUT_, Identifier); }
logic           { return DBOUT(LOGIC, Identifier); }
case            { return DBOUT(CASE, Identifier); }
else            { return DBOUT(ELSE, Identifier); }
enum            { return DBOUT(ENUM, Identifier); }
wire            { return DBOUT(WIRE, Identifier); }
end             { return DBOUT(END, Identifier); }
for             { return DBOUT(FOR, Identifier); }
inc             { return DBOUT(INC, Identifier); }
reg             { return DBOUT(REG, Identifier); }
tri             { return DBOUT(TRI, Identifier); }
if              { return DBOUT(IF, Identifier); }
or              { return DBOUT(OH_ARE, Identifier); }
{id}            { return DBOUT(ID, Identifier); }
"<<<="          |
">>>="          |
"<<="           |
">>="           |
"+="            |
"-="            |
"&="            |
"|="            |
"^="            |
"*="            |
"/="            |
"%="            |
"="             { return DBOUT('=', Operator); }
"<<<"           { return DBOUT(ASL, Operator); }
">>>"           { return DBOUT(ASR, Operator); }
"==="           { return DBOUT(EEQ, Operator); }
"!=="           { return DBOUT(NEEQ, Operator); }
"++"            { return DBOUT(INC, Operator); }
"--"            { return DBOUT(DEC, Operator); }
"<<"            { return DBOUT(LSL, Operator); }
">>"            { return DBOUT(LSR, Operator); }
"=="            { return DBOUT(EQ, Operator); }
"!="            { return DBOUT(NEQ, Operator); }
">="            { return DBOUT(GE, Operator); }
"<="            { return DBOUT(LE, Operator); }
"&&"            { return DBOUT(AND, Operator); }
"||"            { return DBOUT(OR, Operator); }
"**"            { return DBOUT(POWER, Operator); }
"&"             |
"|"             |
"^"             |
"~"             |
"!"             |
"+"             |
"-"             |
"*"             |
"/"             |
"%"             |
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
