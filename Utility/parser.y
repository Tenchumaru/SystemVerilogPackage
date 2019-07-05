%define api.pure full
%locations
%lex-param {bool is_parsing}
%parse-param {struct parse_results& results}
%param {yyscan_t scanner}

%initial-action {
	// I want the locations to use zero-based indexing.
	yylloc= YYLTYPE();
}

%{
#include "parser_p.inl"
%}

%union {
	parse_results* results;
}

%token PARAMETER TYPEDEF ENUM INPUT INOUT OUTPUT INTEGER RETURN UNSIGNED LOGIC
%token TRI WIRE REG FUNCTION ENDFUNCTION INTERFACE ENDINTERFACE MODPORT MODULE
%token ENDMODULE BEGIN_ END ALWAYS ALWAYS_COMB ALWAYS_FF ALWAYS_LATCH INITIAL_
%token POSEDGE NEGEDGE OH_ARE VALUE GENVAR GENERATE ENDGENERATE ASSIGN CASE
%token DEFAULT ENDCASE IF FOR ID STRING ';'
%right THEN ELSE
%right '='
%left '?' ':'
%left AND OR
%left EQ NEQ EEQ NEEQ GE LE '<' '>'
%left ASL LSL ASR LSR
%left '+' '-'
%left '&' '|' '^'
%left '*' '/' '%'
%right '!' '~'
%right POWER
%precedence NEG /* negation:  unary minus, and, or, xor */
%nonassoc '{' '}'
%nonassoc INC DEC

%type<results> definition parameter typedef function interface module generate
%type<results> pparams type type1 base_type enum_values enum_value case_tag
%type<results> more_enum_values expr compound_expr more_exprs params
%type<results> more_params param interface_body module_body interface_statement
%type<results> modport_params modport_param1 more_modport_params modport_param
%type<results> edges edge more_edges id body statement declaration brackets
%type<results> bracket more_brackets instance more_instances ids more_ids args
%type<results> arg more_args case_body reference more_references always inout
%type<results> begin end epilog

%%

input:
%empty
| input definition { P(&results, $2); }
;

definition:
parameter
| typedef
| function
| interface
| module
;

parameter:
PARAMETER type ID '=' expr ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, one, one); T($$, @4, zero, one); P($$, $5); T($$, @6, zero, newline); }
| PARAMETER ID '=' expr ';' { T($$, @1, start_of_line, one); T($$, @2, one, one); T($$, @3, zero, one); P($$, $4); T($$, @5, zero, newline); }
;

typedef:
TYPEDEF type ID brackets ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, one, zero); P($$, $4); T($$, @5, zero, newline); }
| TYPEDEF type ID ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, one, zero); T($$, @4, zero, newline); }
;

function:
FUNCTION type ID '(' params ')' ';' body ENDFUNCTION epilog { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, one, zero); T($$, @4, zero, zero); P($$, $5); T($$, @6, can_start_line, zero); T($$, @7, zero, newline); I($$, $8); T($$, @9, start_of_line, $10->any() ? one : newline); P($$, $10); }
;

interface:
INTERFACE ID '(' params ')' ';' interface_body ENDINTERFACE epilog { C($$); T($$, @1, start_of_line, one); T($$, @2, one, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, can_start_line, zero); T($$, @6, zero, newline); I($$, $7); T($$, @8, start_of_line, $9->any() ? one : newline); P($$, $9); }
;

module:
MODULE ID pparams ';' module_body ENDMODULE epilog { C($$); T($$, @1, start_of_line, one); T($$, @2, one, zero); P($$, $3); T($$, @4, zero, newline); I($$, $5); T($$, @6, start_of_line, $7->any() ? one : newline); P($$, $7); }
;

pparams:
%empty { C($$); }
| '#' '(' PARAMETER ID '=' expr ')' '(' params ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, one); T($$, @4, one, zero); T($$, @5, zero, one); P($$, $6); T($$, @7, zero, zero); T($$, @8, zero, zero); P($$, $9); T($$, @10, can_start_line, zero); }
| '(' params ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, can_start_line, zero); }
;

type:
ENUM type1 '{' enum_values '}' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, one, zero); P($$, $4); T($$, @5, zero, one); }
| type1
;

type1:
base_type
| base_type brackets { $$= $1; P($$, $2); }
| INTEGER { C($$); T($$, @1, start_of_line, zero); }
| INTEGER UNSIGNED { C($$); T($$, @1, start_of_line, one); T($$, @2, one, zero); }
| ID { C($$); T($$, @1, start_of_line, zero); }
;

base_type:
LOGIC { C($$); T($$, @1, start_of_line, zero); }
| REG { C($$); T($$, @1, start_of_line, zero); }
| TRI { C($$); T($$, @1, start_of_line, zero); }
| WIRE { C($$); T($$, @1, start_of_line, zero); }
;

enum_values:
enum_value more_enum_values { $$= $1; P($$, $2); }
;

enum_value:
ID { C($$); T($$, @1, zero, one); }
| ID '=' expr { C($$); T($$, @1, zero, one); T($$, @1, zero, one); P($$, $3); }
;

more_enum_values:
%empty { C($$); }
| more_enum_values ',' enum_value { $$= $1; T($$, @2, zero, one); P($$, $3); }
;

expr:
VALUE { C($$); T($$, @1, zero, one); }
| STRING { C($$); T($$, @1, zero, one); }
| id
| id args { $$= $1; P($$, $2); }
| id brackets { $$= $1; P($$, $2); }
| expr AND expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr OR expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr EQ expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr NEQ expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr GE expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr LE expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '<' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '>' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr ASL expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr LSL expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr ASR expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr LSR expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '+' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '-' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '&' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '|' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '^' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '*' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '/' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr '%' expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| expr POWER expr { $$= $1; T($$, @2, one, one); P($$, $3); }
| '&' expr %prec NEG { C($$); T($$, @1, zero, zero); P($$, $2); }
| '|' expr %prec NEG { C($$); T($$, @1, zero, zero); P($$, $2); }
| '^' expr %prec NEG { C($$); T($$, @1, zero, zero); P($$, $2); }
| '-' expr %prec NEG { C($$); T($$, @1, zero, zero); P($$, $2); }
| INC expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| DEC expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| expr INC { $$= $1; T($$, @2, zero, zero); }
| expr DEC { $$= $1; T($$, @2, zero, zero); }
| '(' expr ')' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, one); }
| '!' expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| '~' expr { C($$); T($$, @1, zero, zero); P($$, $2); }
| expr '?' expr ':' expr { $$= $1; T($$, @2, one, one); P($$, $3); T($$, @4, one, one); P($$, $5); }
| expr '{' expr '}' { $$= $1; T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| compound_expr
;

compound_expr:
'\'' '{' expr more_exprs '}' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, zero); }
| '{' expr more_exprs '}' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
;

more_exprs:
%empty { C($$); }
| ',' expr more_exprs { C($$); T($$, @1, zero, one); P($$, $2); P($$, $3); }
;

params:
%empty { C($$); }
| param more_params { $$= $1; P($$, $2); }
;

more_params:
%empty { C($$); }
| more_params ',' param { $$= $1; T($$, @2, zero, one); P($$, $3); }
;

param:
inout type ID { $$= $1; P($$, $2); T($$, @1, one, zero); }
| inout ID { $$= $1; T($$, @2, one, zero); }
| type ID { $$= $1; T($$, @2, one, zero); }
| ID '.' ID ID { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, one); T($$, @3, one, zero); }
| ID { C($$); T($$, @1, zero, zero); }
;

interface_body:
%empty { C($$); }
| interface_body interface_statement { $$= $1; P($$, $2); }
;

module_body:
%empty { C($$); }
| module_body statement { $$= $1; P($$, $2); }
| module_body always statement { $$= $1; P($$, $2); I($$, $3); }
| module_body generate { $$= $1; P($$, $2); }
;

generate:
GENERATE module_body ENDGENERATE epilog { C($$); T($$, @1, start_of_line, newline); I($$, $2); T($$, @3, start_of_line, $4->any() ? one : newline); P($$, $4); }
;

interface_statement:
declaration
| MODPORT ID '(' modport_params ')' ';' { C($$); T($$, @1, start_of_line, one); T($$, @2, one, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, can_start_line, zero); T($$, @6, zero, newline); }
;

modport_params:
modport_param1 more_modport_params { $$= $1; P($$, $2); }
;

modport_param1:
inout ID { $$= $1; T($$, @2, one, zero); }
;

more_modport_params:
%empty { C($$); }
| more_modport_params ',' modport_param { $$= $1; T($$, @2, zero, one); P($$, $3); }
;

modport_param:
ID { C($$); T($$, @1, zero, zero); }
| modport_param1
;

id:
ID { C($$); T($$, @1, zero, zero); }
| ID '.' ID { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); }
;

body:
%empty { C($$); }
| statement body { $$= $1; P($$, $2); }
;

statement:
parameter
| typedef
| declaration
| ID args ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, zero, newline); }
| begin body end { $$= $1; I($$, $2); P($$, $3); $$->dedent(); }
| '#' VALUE ';' { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); T($$, @3, zero, newline); }
| ASSIGN reference '=' expr ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, zero, one); P($$, $4); T($$, @5, zero, newline); }
| IF '(' expr ')' statement %prec THEN { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, newline); I($$, $5); }
| IF '(' expr ')' statement ELSE statement { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, newline); I($$, $5); T($$, @6, start_of_line, newline); I($$, $7); }
| CASE '(' expr ')' case_body ENDCASE epilog { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); P($$, $3); T($$, @4, zero, newline); I($$, $5); T($$, @6, start_of_line, $7->any() ? one : newline); P($$, $7); }
| FOR '(' ID '=' expr ';' expr ';' expr ')' statement { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); T($$, @4, zero, one); P($$, $5); T($$, @6, zero, one); P($$, $7); T($$, @8, zero, one); P($$, $9); T($$, @10, zero, newline); I($$, $11); }
| reference '=' expr ';' { $$= $1; $1->terminals[0].before= start_of_line; --$1->terminals[0].indent_level; T($$, @2, zero, one); P($$, $3); T($$, @4, zero, newline); }
| reference LE expr ';' { $$= $1; $1->terminals[0].before= start_of_line; --$1->terminals[0].indent_level; T($$, @2, zero, one); P($$, $3); T($$, @4, zero, newline); }
| RETURN expr ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, zero, newline); }
;

declaration:
type instance more_instances ';' { $$= $1; P($$, $2); P($$, $3); T($$, @4, zero, newline); }
| GENVAR ids ';' { C($$); T($$, @1, start_of_line, one); P($$, $2); T($$, @3, zero, newline); }
;

brackets:
bracket more_brackets { $$= $1; P($$, $2); }
;

bracket:
'[' expr ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); }
| '[' expr ':' expr ']' { C($$); T($$, @1, zero, zero); P($$, $2); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

more_brackets:
%empty { C($$); }
| more_brackets bracket { $$= $1; P($$, $2); }
;

instance:
%empty { C($$); }
| ID { C($$); T($$, @1, zero, zero); }
| ID args { C($$); T($$, @1, zero, zero); P($$, $2); }
| ID brackets { C($$); T($$, @1, zero, zero); P($$, $2); }
;

more_instances:
%empty { C($$); }
| more_instances ',' instance { $$= $1; T($$, @2, zero, one); P($$, $3); }
;

ids:
ID more_ids { C($$); T($$, @1, zero, one); P($$, $2); }
;

more_ids:
%empty { C($$); }
| more_ids ',' ID { $$= $1; T($$, @2, zero, one); T($$, @1, zero, zero); }
;

args:
'(' ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| '(' arg more_args ')' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

arg:
expr { $$= $1; }
| '.' ID { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); }
| '.' ID '(' expr ')' { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
;

more_args:
%empty { C($$); }
| more_args ',' arg { $$= $1; T($$, @2, zero, one); P($$, $3); }
;

case_body:
%empty { C($$); }
| case_body case_tag statement { $$= $1; P($$, $2); I($$, $3); }
;

case_tag:
ID ':' { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, newline); }
| VALUE ':' { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, newline); }
| DEFAULT ':' { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, newline); }
;

reference:
instance
| ID '.' instance { C($$); T($$, @1, zero, zero); T($$, @2, zero, zero); P($$, $3); }
| '{' reference more_references '}' { C($$); T($$, @1, zero, zero); P($$, $2); P($$, $3); T($$, @4, zero, zero); }
;

more_references:
%empty { C($$); }
| more_references ',' reference { $$= $1; T($$, @2, zero, one); P($$, $3); }
;

always:
ALWAYS { C($$); T($$, @1, start_of_line, one); }
| ALWAYS '@' '(' edges ')' { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| ALWAYS_COMB { C($$); T($$, @1, start_of_line, one); }
| ALWAYS_FF '@' '(' edges ')' { C($$); T($$, @1, start_of_line, zero); T($$, @2, zero, zero); T($$, @3, zero, zero); P($$, $4); T($$, @5, zero, zero); }
| ALWAYS_LATCH { C($$); T($$, @1, start_of_line, one); }
| INITIAL_ { C($$); T($$, @1, start_of_line, one); }
;

edges:
edge more_edges { $$= $1; P($$, $2); }
;

edge:
POSEDGE id { C($$); T($$, @1, zero, one); P($$, $2); }
| NEGEDGE id { C($$); T($$, @1, zero, one); P($$, $2); }
;

more_edges:
%empty { C($$); }
| more_edges ',' edge { $$= $1; T($$, @2, zero, one); P($$, $3); }
| more_edges OH_ARE edge { $$= $1; T($$, @2, one, one); P($$, $3); }
;

inout:
INPUT { C($$); T($$, @1, zero, one); }
| INOUT { C($$); T($$, @1, zero, one); }
| OUTPUT { C($$); T($$, @1, zero, one); }
;

begin:
BEGIN_ epilog { C($$); T($$, @1, can_start_line, one); P($$, $2); }
;

end:
END epilog { C($$); T($$, @1, start_of_line, one); P($$, $2); }
;

epilog:
%empty { C($$); }
| ':' ID { C($$); T($$, @1, one, one); T($$, @2, one, newline); }
;

%%

#include "parser_e.inl"
