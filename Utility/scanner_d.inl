#include <cctype>
#include <cstdlib>
#include <cstring>
#include "exports.h"
#include "parser.h"

// This is executed before every action.  YY_RULE_SETUP is defined as YY_USER_ACTION.
#define YY_USER_ACTION yylloc->last_column += yyleng;

// Skip to next line.
#define NL() do { yylloc->last_line= ++yylloc->first_line; yylloc->first_column= yylloc->last_column= 0; } while(false)

// Skip matched text.
#define SKIP() yylloc->first_column= yylloc->last_column

// Although I'm not using it since I set the noyyset_extra option above, the
// scanner still invokes it.
#define yyset_extra(a,b) ((void)0)

// Select the token based on whether I'm also parsing or only scanning.
#define SELECT(v1,v2) (is_parsing ? (v1) : (v2))

#ifdef _DEBUG
static char const* token_names[]= {
  "$end", "error", "$undefined", "PARAMETER", "TYPEDEF", "ENUM", "INPUT",
  "INOUT", "OUTPUT", "INTEGER", "RETURN", "UNSIGNED", "LOGIC", "TRI",
  "WIRE", "REG", "FUNCTION", "ENDFUNCTION", "INTERFACE", "ENDINTERFACE",
  "MODPORT", "MODULE", "ENDMODULE", "BEGIN_", "END", "ALWAYS",
  "ALWAYS_COMB", "ALWAYS_FF", "ALWAYS_LATCH", "INITIAL_", "POSEDGE",
  "NEGEDGE", "OH_ARE", "VALUE", "GENVAR", "GENERATE", "ENDGENERATE",
  "ASSIGN", "CASE", "DEFAULT", "ENDCASE", "IF", "FOR", "ID", "STRING",
  "';'", "THEN", "ELSE", "'='", "'?'", "':'", "AND", "OR", "EQ", "NEQ",
  "GE", "LE", "'<'", "'>'", "ASL", "LSL", "ASR", "LSR", "'+'", "'-'",
  "'&'", "'|'", "'^'", "'*'", "'/'", "'%'", "'!'", "'~'", "POWER", "NEG",
  "'{'", "'}'", "INC", "DEC", "'('", "')'", "'#'", "','", "'\\''", "'.'",
};

static int _DBOUT(struct YYLTYPE* yylloc, char const* s, int v) {
	char buf[99];
	OutputDebugStringA("token '");
	OutputDebugStringA(s);
	OutputDebugStringA("' (");
	sprintf_s(buf, "%d,%d,%d,%d", yylloc->first_line, yylloc->first_column, yylloc->last_line, yylloc->last_column);
	OutputDebugStringA(buf);
	OutputDebugStringA(") (");
	if(v >= 258) {
		OutputDebugStringA(token_names[v - 255]);
	} else if(v == '\'') {
		OutputDebugStringA("'\\''");
	} else {
		buf[0]= '\'';
		buf[1]= (char)v;
		buf[2]= '\'';
		buf[3]= '\0';
		OutputDebugStringA(buf);
	}
	sprintf_s(buf, "): %d\n", v);
	OutputDebugStringA(buf);
	return v;
}

static void _ECHO(char const* s) {
	OutputDebugStringA("unexpected text '");
	OutputDebugStringA(s);
	OutputDebugStringA("'\n");
}

#	define DBOUT(v1,v2) _DBOUT(yylloc, yytext, SELECT(v1, v2))
#	define ECHO _ECHO(yytext)
#else
#	define DBOUT SELECT
#	define ECHO ((void)0)
#endif

#pragma warning(push)
#pragma warning(disable: 4100 4127 4996)
