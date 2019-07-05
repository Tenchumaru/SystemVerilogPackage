#include "stdafx.h"

bool alert(char const* s) {
	return ::MessageBoxA(::GetForegroundWindow(), s, NULL, MB_ICONERROR | MB_OKCANCEL) == IDOK;
}

class keyword_dict {
public:
	keyword_dict() {
		for(int i = 0; i < _countof(::keywords); ++i) {
			keywords.insert(::keywords[i]);
		}
	}
	bool contains(char const* s, int begin, int end) const { return keywords.find(std::string(s + begin, s + end)) != keywords.end(); }

private:
	std::set<std::string> keywords;
};

void parse_results::add(int line, int column, whitespace_behavior before, whitespace_behavior after) {
	parse_result result = { line, column, before == start_of_line || before == can_start_line ? 0 : 1, before, after };
	terminals.push_back(result);
}

parse_results* parse_results::create() {
	parse_results* rv = new parse_results;
	pool.push_back(rv);
	return rv;
}

void parse_results::promote(parse_results* results, bool indented) {
	if(indented) {
		for(std::vector<parse_result>::iterator i = results->terminals.begin(); i != results->terminals.end(); ++i) {
			++i->indent_level;
		}
	}
	terminals.insert(terminals.end(), results->terminals.begin(), results->terminals.end());
}

void parse_results::dedent() {
	for(std::vector<parse_result>::iterator i = terminals.begin(); i != terminals.end(); ++i) {
		--i->indent_level;
	}
}

parse_results::~parse_results() {
	for(std::vector<parse_results*>::iterator i = pool.begin(); i != pool.end(); ++i) {
		delete *i;
	}
}

extern "C" __declspec(dllexport) int GetTokenType(char const* s, bool isInComment, int& i) {
	int begin = i;
	int rv = zz_scan_string(s, isInComment, i);
	if(rv == Identifier) {
		static keyword_dict dict;
		if(dict.contains(s, begin, i + 1))
			rv = Keyword;
	}
	return rv;
}

#ifdef _DEBUG
static void dump(parse_results const& results) {
	static char const* wsb_text[] = { "zero", "one", "start_of_line", "newline", "can_start_line" };
	char buf[99];
	sprintf_s(buf, "results @ 0x%p (%d)\n", &results, results.terminals.size());
	OutputDebugStringA(buf);
	if(!results.terminals.empty()) {
		for(std::vector<parse_result>::const_iterator i = results.terminals.begin(); i != results.terminals.end(); ++i) {
			sprintf_s(buf, "\t%d, %d, %d, %s, %s\n", i->indent_level, i->line, i->column, wsb_text[i->before], wsb_text[i->after]);
			OutputDebugStringA(buf);
		}
	}
}
#else
#	define dump(_) ((void)0)
#endif

extern "C" __declspec(dllexport) std::vector<parse_result>* ParseText(char const* s, unsigned& count) {
	parse_results results;
	zz_parse(s, results);
	dump(results);
	std::vector<parse_result>* rv = new std::vector<parse_result>;
	rv->swap(results.terminals);
	count = rv->size();
	return rv;
}

extern "C" __declspec(dllexport) void GetParseResults(std::vector<parse_result>* parse, parse_result results[], unsigned count) {
	if(parse->size() < count)
		count = parse->size();
	std::copy_n(parse->begin(), count, results);
}
