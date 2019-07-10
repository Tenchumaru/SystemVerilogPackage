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
pulsestyle_ondetect      { return DBOUT(PULSESTYLE_ONDETECT_, Identifier); }
pulsestyle_onevent       { return DBOUT(PULSESTYLE_ONEVENT_, Identifier); }
noshowcancelled          { return DBOUT(NOSHOWCANCELLED_, Identifier); }
sync_accept_on           { return DBOUT(SYNC_ACCEPT_ON_, Identifier); }
sync_reject_on           { return DBOUT(SYNC_REJECT_ON_, Identifier); }
showcancelled            { return DBOUT(SHOWCANCELLED_, Identifier); }
timeprecision            { return DBOUT(TIMEPRECISION_, Identifier); }
always_latch             { return DBOUT(ALWAYS_LATCH_, Identifier); }
endinterface             { return DBOUT(ENDINTERFACE_, Identifier); }
endprimitive             { return DBOUT(ENDPRIMITIVE_, Identifier); }
illegal_bins             { return DBOUT(ILLEGAL_BINS_, Identifier); }
interconnect             { return DBOUT(INTERCONNECT_, Identifier); }
randsequence             { return DBOUT(RANDSEQUENCE_, Identifier); }
s_eventually             { return DBOUT(S_EVENTUALLY_, Identifier); }
s_until_with             { return DBOUT(S_UNTIL_WITH_, Identifier); }
always_comb              { return DBOUT(ALWAYS_COMB_, Identifier); }
endclocking              { return DBOUT(ENDCLOCKING_, Identifier); }
endfunction              { return DBOUT(ENDFUNCTION_, Identifier); }
endgenerate              { return DBOUT(ENDGENERATE_, Identifier); }
endproperty              { return DBOUT(ENDPROPERTY_, Identifier); }
endsequence              { return DBOUT(ENDSEQUENCE_, Identifier); }
first_match              { return DBOUT(FIRST_MATCH_, Identifier); }
ignore_bins              { return DBOUT(IGNORE_BINS_, Identifier); }
macromodule              { return DBOUT(MACROMODULE_, Identifier); }
type_option              { return DBOUT(TYPE_OPTION_, Identifier); }
"$setuphold"             { return DBOUT(Dsetuphold, Operator); }
constraint               { return DBOUT(CONSTRAINT_, Identifier); }
covergroup               { return DBOUT(COVERGROUP_, Identifier); }
coverpoint               { return DBOUT(COVERPOINT_, Identifier); }
endchecker               { return DBOUT(ENDCHECKER_, Identifier); }
endpackage               { return DBOUT(ENDPACKAGE_, Identifier); }
endprogram               { return DBOUT(ENDPROGRAM_, Identifier); }
endspecify               { return DBOUT(ENDSPECIFY_, Identifier); }
eventually               { return DBOUT(EVENTUALLY_, Identifier); }
implements               { return DBOUT(IMPLEMENTS_, Identifier); }
localparam               { return DBOUT(LOCALPARAM_, Identifier); }
"PATHPULSE$"             { return DBOUT(PATHPULSED, Operator); }
s_nexttime               { return DBOUT(S_NEXTTIME_, Identifier); }
throughout               { return DBOUT(THROUGHOUT_, Identifier); }
until_with               { return DBOUT(UNTIL_WITH_, Identifier); }
wait_order               { return DBOUT(WAIT_ORDER_, Identifier); }
"$fullskew"              { return DBOUT(Dfullskew, Operator); }
"$nochange"              { return DBOUT(Dnochange, Operator); }
"$recovery"              { return DBOUT(Drecovery, Operator); }
"$timeskew"              { return DBOUT(Dtimeskew, Operator); }
accept_on                { return DBOUT(ACCEPT_ON_, Identifier); }
always_ff                { return DBOUT(ALWAYS_FF_, Identifier); }
automatic                { return DBOUT(AUTOMATIC_, Identifier); }
endconfig                { return DBOUT(ENDCONFIG_, Identifier); }
endmodule                { return DBOUT(ENDMODULE_, Identifier); }
interface                { return DBOUT(INTERFACE_, Identifier); }
intersect                { return DBOUT(INTERSECT_, Identifier); }
join_none                { return DBOUT(JOIN_NONE_, Identifier); }
parameter                { return DBOUT(PARAMETER_, Identifier); }
primitive                { return DBOUT(PRIMITIVE_, Identifier); }
protected                { return DBOUT(PROTECTED_, Identifier); }
randomize                { return DBOUT(RANDOMIZE_, Identifier); }
reject_on                { return DBOUT(REJECT_ON_, Identifier); }
shortreal                { return DBOUT(SHORTREAL_, Identifier); }
specparam                { return DBOUT(SPECPARAM_, Identifier); }
"$removal"               { return DBOUT(Dremoval, Operator); }
"$warning"               { return DBOUT(Dwarning, Operator); }
clocking                 { return DBOUT(CLOCKING_, Identifier); }
constant                 { return DBOUT(CONSTANT_, Identifier); }
continue                 { return DBOUT(CONTINUE_, Identifier); }
deassign                 { return DBOUT(DEASSIGN_, Identifier); }
defparam                 { return DBOUT(DEFPARAM_, Identifier); }
endclass                 { return DBOUT(ENDCLASS_, Identifier); }
endgroup                 { return DBOUT(ENDGROUP_, Identifier); }
endtable                 { return DBOUT(ENDTABLE_, Identifier); }
forkjoin                 { return DBOUT(FORKJOIN_, Identifier); }
function                 { return DBOUT(FUNCTION_, Identifier); }
generate                 { return DBOUT(GENERATE_, Identifier); }
instance                 { return DBOUT(INSTANCE_, Identifier); }
join_any                 { return DBOUT(JOIN_ANY_, Identifier); }
nexttime                 { return DBOUT(NEXTTIME_, Identifier); }
priority                 { return DBOUT(PRIORITY_, Identifier); }
property                 { return DBOUT(PROPERTY_, Identifier); }
pulldown                 { return DBOUT(PULLDOWN_, Identifier); }
randcase                 { return DBOUT(RANDCASE_, Identifier); }
realtime                 { return DBOUT(REALTIME_, Identifier); }
restrict                 { return DBOUT(RESTRICT_, Identifier); }
rtranif0                 { return DBOUT(RTRANIF0_, Identifier); }
rtranif1                 { return DBOUT(RTRANIF1_, Identifier); }
s_always                 { return DBOUT(S_ALWAYS_, Identifier); }
scalared                 { return DBOUT(SCALARED_, Identifier); }
sequence                 { return DBOUT(SEQUENCE_, Identifier); }
shortint                 { return DBOUT(SHORTINT_, Identifier); }
timeunit                 { return DBOUT(TIMEUNIT_, Identifier); }
unsigned                 { return DBOUT(UNSIGNED_, Identifier); }
vectored                 { return DBOUT(VECTORED_, Identifier); }
wildcard                 { return DBOUT(WILDCARD_, Identifier); }
"$period"                { return DBOUT(Dperiod, Operator); }
"$recrem"                { return DBOUT(Drecrem, Operator); }
chandle                  { return DBOUT(CHANDLE_, Identifier); }
checker                  { return DBOUT(CHECKER_, Identifier); }
context                  { return DBOUT(CONTEXT_, Identifier); }
default                  { return DBOUT(DEFAULT_, Identifier); }
disable                  { return DBOUT(DISABLE_, Identifier); }
endcase                  { return DBOUT(ENDCASE_, Identifier); }
endtask                  { return DBOUT(ENDTASK_, Identifier); }
extends                  { return DBOUT(EXTENDS_, Identifier); }
foreach                  { return DBOUT(FOREACH_, Identifier); }
forever                  { return DBOUT(FOREVER_, Identifier); }
implies                  { return DBOUT(IMPLIES_, Identifier); }
"-incdir"                { return DBOUT(Mincdir, Operator); }
include                  { return DBOUT(INCLUDE_, Identifier); }
initial                  { return DBOUT(INITIAL_, Identifier); }
integer                  { return DBOUT(INTEGER_, Identifier); }
liblist                  { return DBOUT(LIBLIST_, Identifier); }
library                  { return DBOUT(LIBRARY_, Identifier); }
"local::"                { return DBOUT(localCC, Operator); }
longint                  { return DBOUT(LONGINT_, Identifier); }
matches                  { return DBOUT(MATCHES_, Identifier); }
modport                  { return DBOUT(MODPORT_, Identifier); }
negedge                  { return DBOUT(NEGEDGE_, Identifier); }
nettype                  { return DBOUT(NETTYPE_, Identifier); }
package                  { return DBOUT(PACKAGE_, Identifier); }
posedge                  { return DBOUT(POSEDGE_, Identifier); }
program                  { return DBOUT(PROGRAM_, Identifier); }
release                  { return DBOUT(RELEASE_, Identifier); }
s_until                  { return DBOUT(S_UNTIL_, Identifier); }
specify                  { return DBOUT(SPECIFY_, Identifier); }
strong0                  { return DBOUT(STRONG0_, Identifier); }
strong1                  { return DBOUT(STRONG1_, Identifier); }
supply0                  { return DBOUT(SUPPLY0_, Identifier); }
supply1                  { return DBOUT(SUPPLY1_, Identifier); }
tranif0                  { return DBOUT(TRANIF0_, Identifier); }
tranif1                  { return DBOUT(TRANIF1_, Identifier); }
typedef                  { return DBOUT(TYPEDEF_, Identifier); }
unique0                  { return DBOUT(UNIQUE0_, Identifier); }
untyped                  { return DBOUT(UNTYPED_, Identifier); }
virtual                  { return DBOUT(VIRTUAL_, Identifier); }
"$error"                 { return DBOUT(Derror, Operator); }
"$fatal"                 { return DBOUT(Dfatal, Operator); }
"$setup"                 { return DBOUT(Dsetup, Operator); }
"$width"                 { return DBOUT(Dwidth, Operator); }
always                   { return DBOUT(ALWAYS_, Identifier); }
assert                   { return DBOUT(ASSERT_, Identifier); }
assign                   { return DBOUT(ASSIGN_, Identifier); }
assume                   { return DBOUT(ASSUME_, Identifier); }
before                   { return DBOUT(BEFORE_, Identifier); }
binsof                   { return DBOUT(BINSOF_, Identifier); }
bufif0                   { return DBOUT(BUFIF0_, Identifier); }
bufif1                   { return DBOUT(BUFIF1_, Identifier); }
config                   { return DBOUT(CONFIG_, Identifier); }
design                   { return DBOUT(DESIGN_, Identifier); }
expect                   { return DBOUT(EXPECT_, Identifier); }
export                   { return DBOUT(EXPORT_, Identifier); }
extern                   { return DBOUT(EXTERN_, Identifier); }
genvar                   { return DBOUT(GENVAR_, Identifier); }
global                   { return DBOUT(GLOBAL_, Identifier); }
highz0                   { return DBOUT(HIGHZ0_, Identifier); }
highz1                   { return DBOUT(HIGHZ1_, Identifier); }
ifnone                   { return DBOUT(IFNONE_, Identifier); }
import                   { return DBOUT(IMPORT_, Identifier); }
inside                   { return DBOUT(INSIDE_, Identifier); }
medium                   { return DBOUT(MEDIUM_, Identifier); }
module                   { return DBOUT(MODULE_, Identifier); }
notif0                   { return DBOUT(NOTIF0_, Identifier); }
notif1                   { return DBOUT(NOTIF1_, Identifier); }
option                   { return DBOUT(OPTION_, Identifier); }
output                   { return DBOUT(OUTPUT_, Identifier); }
packed                   { return DBOUT(PACKED_, Identifier); }
pullup                   { return DBOUT(PULLUP_, Identifier); }
repeat                   { return DBOUT(REPEAT_, Identifier); }
return                   { return DBOUT(RETURN_, Identifier); }
sample                   { return DBOUT(SAMPLE_, Identifier); }
signed                   { return DBOUT(SIGNED_, Identifier); }
static                   { return DBOUT(STATIC_, Identifier); }
string                   { return DBOUT(STRING_, Identifier); }
strong                   { return DBOUT(STRONG_, Identifier); }
struct                   { return DBOUT(STRUCT_, Identifier); }
tagged                   { return DBOUT(TAGGED_, Identifier); }
triand                   { return DBOUT(TRIAND_, Identifier); }
trireg                   { return DBOUT(TRIREG_, Identifier); }
unique                   { return DBOUT(UNIQUE_, Identifier); }
within                   { return DBOUT(WITHIN_, Identifier); }
"##[*]"                  { return DBOUT(NNOSBSCSB, Operator); }
"##[+]"                  { return DBOUT(NNOSBPLUSCSB, Operator); }
"$hold"                  { return DBOUT(Dhold, Operator); }
"$info"                  { return DBOUT(Dinfo, Operator); }
"$root"                  { return DBOUT(Droot, Operator); }
"$skew"                  { return DBOUT(Dskew, Operator); }
"$unit"                  { return DBOUT(Dunit, Operator); }
1step                    { return DBOUT(_1step, Identifier); }
alias                    { return DBOUT(ALIAS_, Identifier); }
begin                    { return DBOUT(BEGIN_, Identifier); }
break                    { return DBOUT(BREAK_, Identifier); }
casex                    { return DBOUT(CASEX_, Identifier); }
casez                    { return DBOUT(CASEZ_, Identifier); }
class                    { return DBOUT(CLASS_, Identifier); }
const                    { return DBOUT(CONST_, Identifier); }
cover                    { return DBOUT(COVER_, Identifier); }
cross                    { return DBOUT(CROSS_, Identifier); }
"DPI-C"                  { return DBOUT(DPIMC, Operator); }
event                    { return DBOUT(EVENT_, Identifier); }
final                    { return DBOUT(FINAL_, Identifier); }
force                    { return DBOUT(FORCE_, Identifier); }
inout                    { return DBOUT(INOUT_, Identifier); }
input                    { return DBOUT(INPUT_, Identifier); }
large                    { return DBOUT(LARGE_, Identifier); }
local                    { return DBOUT(LOCAL_, Identifier); }
logic                    { return DBOUT(LOGIC_, Identifier); }
pull0                    { return DBOUT(PULL0_, Identifier); }
pull1                    { return DBOUT(PULL1_, Identifier); }
randc                    { return DBOUT(RANDC_, Identifier); }
rcmos                    { return DBOUT(RCMOS_, Identifier); }
rnmos                    { return DBOUT(RNMOS_, Identifier); }
rpmos                    { return DBOUT(RPMOS_, Identifier); }
rtran                    { return DBOUT(RTRAN_, Identifier); }
small                    { return DBOUT(SMALL_, Identifier); }
solve                    { return DBOUT(SOLVE_, Identifier); }
"std::"                  { return DBOUT(stdCC, Operator); }
super                    { return DBOUT(SUPER_, Identifier); }
table                    { return DBOUT(TABLE_, Identifier); }
trior                    { return DBOUT(TRIOR_, Identifier); }
union                    { return DBOUT(UNION_, Identifier); }
until                    { return DBOUT(UNTIL_, Identifier); }
uwire                    { return DBOUT(UWIRE_, Identifier); }
weak0                    { return DBOUT(WEAK0_, Identifier); }
weak1                    { return DBOUT(WEAK1_, Identifier); }
while                    { return DBOUT(WHILE_, Identifier); }
"*::*"                   { return DBOUT(SCCS, Operator); }
"<<<="                   { return DBOUT(LLLE, Operator); }
">>>="                   { return DBOUT(GGGE, Operator); }
"1'b0"                   { return DBOUT(_1APOSb0, Operator); }
"1'B0"                   { return DBOUT(_1APOSB0, Operator); }
"1'b1"                   { return DBOUT(_1APOSb1, Operator); }
"1'B1"                   { return DBOUT(_1APOSB1, Operator); }
"1'bx"                   { return DBOUT(_1APOSbx, Operator); }
"1'bX"                   { return DBOUT(_1APOSbX, Operator); }
"1'Bx"                   { return DBOUT(_1APOSBx, Operator); }
"1'BX"                   { return DBOUT(_1APOSBX, Operator); }
bind                     { return DBOUT(BIND_, Identifier); }
bins                     { return DBOUT(BINS_, Identifier); }
byte                     { return DBOUT(BYTE_, Identifier); }
case                     { return DBOUT(CASE_, Identifier); }
cell                     { return DBOUT(CELL_, Identifier); }
cmos                     { return DBOUT(CMOS_, Identifier); }
dist                     { return DBOUT(DIST_, Identifier); }
edge                     { return DBOUT(EDGE_, Identifier); }
else                     { return DBOUT(ELSE_, Identifier); }
enum                     { return DBOUT(ENUM_, Identifier); }
fork                     { return DBOUT(FORK_, Identifier); }
join                     { return DBOUT(JOIN_, Identifier); }
nand                     { return DBOUT(NAND_, Identifier); }
nmos                     { return DBOUT(NMOS_, Identifier); }
null                     { return DBOUT(NULL_, Identifier); }
pmos                     { return DBOUT(PMOS_, Identifier); }
pure                     { return DBOUT(PURE_, Identifier); }
rand                     { return DBOUT(RAND_, Identifier); }
real                     { return DBOUT(REAL_, Identifier); }
soft                     { return DBOUT(SOFT_, Identifier); }
task                     { return DBOUT(TASK_, Identifier); }
this                     { return DBOUT(THIS_, Identifier); }
time                     { return DBOUT(TIME_, Identifier); }
tran                     { return DBOUT(TRAN_, Identifier); }
tri0                     { return DBOUT(TRI0_, Identifier); }
tri1                     { return DBOUT(TRI1_, Identifier); }
type                     { return DBOUT(TYPE_, Identifier); }
void                     { return DBOUT(VOID_, Identifier); }
wait                     { return DBOUT(WAIT_, Identifier); }
wand                     { return DBOUT(WAND_, Identifier); }
weak                     { return DBOUT(WEAK_, Identifier); }
wire                     { return DBOUT(WIRE_, Identifier); }
with                     { return DBOUT(WITH_, Identifier); }
xnor                     { return DBOUT(XNOR_, Identifier); }
"!=?"                    { return DBOUT(BANGEQ, Operator); }
"!=="                    { return DBOUT(BANGEE, Operator); }
"#-#"                    { return DBOUT(NMN, Operator); }
"#=#"                    { return DBOUT(NEN, Operator); }
"&&&"                    { return DBOUT(AMPAMPAMP, Operator); }
"(*)"                    { return DBOUT(OPSCP, Operator); }
"[*]"                    { return DBOUT(OSBSCSB, Operator); }
"[+]"                    { return DBOUT(OSBPLUSCSB, Operator); }
"[->"                    { return DBOUT(OSBMG, Operator); }
"|=>"                    { return DBOUT(PIPEEG, Operator); }
"|->"                    { return DBOUT(PIPEMG, Operator); }
"<<<"                    { return DBOUT(LLL, Operator); }
"<<="                    { return DBOUT(LLE, Operator); }
"<->"                    { return DBOUT(LMG, Operator); }
"==?"                    { return DBOUT(EEQ, Operator); }
"==="                    { return DBOUT(EEE, Operator); }
"->>"                    { return DBOUT(MGG, Operator); }
">>="                    { return DBOUT(GGE, Operator); }
">>>"                    { return DBOUT(GGG, Operator); }
and                      { return DBOUT(AND_, Identifier); }
"'b0"                    { return DBOUT(APOSb0, Operator); }
"'B0"                    { return DBOUT(APOSB0, Operator); }
"'b1"                    { return DBOUT(APOSb1, Operator); }
"'B1"                    { return DBOUT(APOSB1, Operator); }
bit                      { return DBOUT(BIT_, Identifier); }
buf                      { return DBOUT(BUF_, Identifier); }
DPI                      { return DBOUT(DPI, Identifier); }
end                      { return DBOUT(END_, Identifier); }
for                      { return DBOUT(FOR_, Identifier); }
iff                      { return DBOUT(IFF_, Identifier); }
int                      { return DBOUT(INT_, Identifier); }
let                      { return DBOUT(LET_, Identifier); }
new                      { return DBOUT(NEW_, Identifier); }
nor                      { return DBOUT(NOR_, Identifier); }
not                      { return DBOUT(NOT_, Identifier); }
ref                      { return DBOUT(REF_, Identifier); }
reg                      { return DBOUT(REG_, Identifier); }
tri                      { return DBOUT(TRI_, Identifier); }
use                      { return DBOUT(USE_, Identifier); }
var                      { return DBOUT(VAR_, Identifier); }
wor                      { return DBOUT(WOR_, Identifier); }
xor                      { return DBOUT(XOR_, Identifier); }
"--"                     { return DBOUT(MM, Operator); }
"!="                     { return DBOUT(BANGE, Operator); }
"##"                     { return DBOUT(NN, Operator); }
"#0"                     { return DBOUT(N0, Operator); }
"%="                     { return DBOUT(PE, Operator); }
"&&"                     { return DBOUT(AMPAMP, Operator); }
"&="                     { return DBOUT(AMPE, Operator); }
"(*"                     { return DBOUT(OPS, Operator); }
"*)"                     { return DBOUT(SCP, Operator); }
"**"                     { return DBOUT(SS, Operator); }
"*="                     { return DBOUT(SE, Operator); }
"*>"                     { return DBOUT(SG, Operator); }
".*"                     { return DBOUT(DOTS, Operator); }
"/="                     { return DBOUT(VE, Operator); }
"-:"                     { return DBOUT(MC, Operator); }
":/"                     { return DBOUT(CV, Operator); }
"::"                     { return DBOUT(CC, Operator); }
":="                     { return DBOUT(CE, Operator); }
"@*"                     { return DBOUT(ATS, Operator); }
"@@"                     { return DBOUT(ATAT, Operator); }
"[*"                     { return DBOUT(OSBS, Operator); }
"[="                     { return DBOUT(OSBE, Operator); }
"^~"                     { return DBOUT(HT, Operator); }
"^="                     { return DBOUT(HE, Operator); }
"'{"                     { return DBOUT(APOSOCB, Operator); }
"||"                     { return DBOUT(PIPEPIPE, Operator); }
"|="                     { return DBOUT(PIPEE, Operator); }
"~&"                     { return DBOUT(TAMP, Operator); }
"~^"                     { return DBOUT(TH, Operator); }
"~|"                     { return DBOUT(TPIPE, Operator); }
"+:"                     { return DBOUT(PLUSC, Operator); }
"++"                     { return DBOUT(PLUSPLUS, Operator); }
"+="                     { return DBOUT(PLUSE, Operator); }
"<<"                     { return DBOUT(LL, Operator); }
"<="                     { return DBOUT(LE, Operator); }
"-="                     { return DBOUT(ME, Operator); }
"=="                     { return DBOUT(EE, Operator); }
"=>"                     { return DBOUT(EG, Operator); }
"->"                     { return DBOUT(MG, Operator); }
">="                     { return DBOUT(GE, Operator); }
">>"                     { return DBOUT(GG, Operator); }
01                       { return DBOUT(_01, Identifier); }
10                       { return DBOUT(_10, Identifier); }
do                       { return DBOUT(DO_, Identifier); }
fs                       { return DBOUT(FS_, Identifier); }
if                       { return DBOUT(IF_, Identifier); }
ms                       { return DBOUT(MS_, Identifier); }
ns                       { return DBOUT(NS_, Identifier); }
or                       { return DBOUT(OR_, Identifier); }
ps                       { return DBOUT(PS_, Identifier); }
us                       { return DBOUT(US_, Identifier); }
{bin}           |
{dec}           |
{hex}           |
{num}           { return DBOUT(INTEGRAL_NUMBER_, Literal); }
{fix}           |
{flt}           { return DBOUT(REAL_NUMBER_, Literal); }
{uul}           { return DBOUT(UNBASED_UNSIZED_LITERAL_, Literal); }
{cid}           { return DBOUT(CID_, Identifier); }
{eid}           { return DBOUT(EID_, Identifier); }
{sid}           { return DBOUT(SID_, Identifier); }
{syd}           { return DBOUT(SYSID_, Identifier); }
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
