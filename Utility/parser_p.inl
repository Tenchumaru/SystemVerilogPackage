#include <cstdio>
#include <cstring>
#include <string>
#include "exports.h"
typedef union YYSTYPE YYSTYPE;
#include "scanner.h"

static bool const is_parsing= true;

#define C(n) n= results.create()
#define T(n,l,b,e) ((n)->add((l).first_line, (l).first_column, (b), (e)))
#define P(nl,nr) (nl)->promote((nr), false)
#define I(nl,nr) (nl)->promote((nr), true)

static void yyerror(struct YYLTYPE* yylloc, parse_results& results, yyscan_t scanner, char const* message);
YY_DECL;

#pragma warning(push)
#pragma warning(disable: 4127 4244 4702)
