%define api.pure full
%locations
%lex-param {bool is_parsing}
%parse-param {struct parse_results& results}
%param {yyscan_t scanner}

%initial-action {
	// I want the locations to use zero-based indexing.
	yylloc = YYLTYPE();
}

%{
#include "parser_p.inl"
%}

%union {
	parse_results* results;
}
