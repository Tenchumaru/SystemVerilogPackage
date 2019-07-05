#pragma warning(pop)

int zz_scan_string(char const* s, bool is_in_comment, int& i) {
	yyscan_t scanner;
	yylex_init(&scanner);
	YY_BUFFER_STATE buf = yy_scan_string(s + i, scanner);
	struct yyguts_t *yyg = static_cast<struct yyguts_t*>(scanner);
	BEGIN(is_in_comment ? COMMENT : INITIAL);
	YYSTYPE yylval_param;
	YYLTYPE yylloc_param = {};
	int rv = yylex(&yylval_param, &yylloc_param, false, scanner);
	i += yylloc_param.last_column - 1;
	yy_delete_buffer(buf, scanner);
	yylex_destroy(scanner);
	return rv;
}
