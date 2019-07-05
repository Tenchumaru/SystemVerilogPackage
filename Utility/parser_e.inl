#pragma warning(pop)

static bool keep_alerting = true;

static void yyerror(struct YYLTYPE* yylloc, parse_results& /*results*/, yyscan_t /*scanner*/, char const* message) {
	std::string s = "problem: ";
	s += message;
	s += " in line ";
	char buf[32];
	sprintf_s(buf, "%d", yylloc->first_line + 1);
	s += buf;
	if(keep_alerting && !alert(s.c_str()))
		keep_alerting = false;
}

void zz_parse(char const* s, parse_results& results) {
	yyscan_t scanner;
	yylex_init(&scanner);
	YY_BUFFER_STATE buf = yy_scan_string(s, scanner);
	int rv = yyparse(results, scanner); rv;
	yy_delete_buffer(buf, scanner);
	yylex_destroy(scanner);
}
