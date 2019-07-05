#pragma once

#include <vector>

#define YY_DECL int yylex(union YYSTYPE* yylval_param, struct YYLTYPE* yylloc_param, bool is_parsing, yyscan_t yyscanner)

enum whitespace_behavior { zero, one, start_of_line, newline, can_start_line, };

struct parse_result {
	int line, column, indent_level;
	whitespace_behavior before, after;
};

struct parse_results {
	std::vector<parse_result> terminals;
	std::vector<parse_results*> pool;
	void add(int line, int column, whitespace_behavior before, whitespace_behavior after);
	bool any() const { return !terminals.empty(); }
	void promote(parse_results* results, bool indented);
	void dedent();
	parse_results* create();
	~parse_results();
};

enum TokenType
{
	Unknown = 0,
	Text = 1,
	Keyword = 2,
	Identifier = 3,
	String = 4,
	Literal = 5,
	Operator = 6,
	Delimiter = 7,
	WhiteSpace = 8,
	LineComment = 9,
	Comment = 10,
};

void _OutputDebugString(char const* s);
#ifdef _DEBUG
void _DebugBreak();
#endif

int zz_scan_string(char const* s, bool is_in_comment, int& i);
void zz_parse(char const* s, parse_results& results);
bool alert(char const* s);
