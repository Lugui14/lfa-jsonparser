%{
#include "util.h"
#include "node.h"
#include "grammar_symbols.h"

int yylex(void);
void yyerror(const char *msg);

// Global variable pointing to root of parse tree
struct Node *g_parse_tree;
%}

%union {
  struct Node *node;
}

%token<node> TOK_LBRACE TOK_RBRACE TOK_LBRACKET TOK_RBRACKET
%token<node> TOK_COLON TOK_COMMA
%token<node> TOK_NUMBER TOK_STRING_LITERAL

%type<node> value
%type<node> object opt_field_list field_list field
%type<node> array opt_value_list value_list

%%

value
	: object
	| array
	| TOK_NUMBER
	| TOK_STRING_LITERAL
	;

object
	: TOK_LBRACE opt_field_list TOK_RBRACE
	;

opt_field_list
	: field_list
	| /* epsilon */
	;

field_list
	: field
	| field TOK_COMMA field_list
	;

field
	: TOK_STRING_LITERAL TOK_COLON value
	;

array
	: TOK_LBRACKET opt_value_list TOK_RBRACKET
	;

opt_value_list
	: value_list
	| /* epsilon */
	;

value_list
	: value
	| value TOK_COMMA value_list
	;

%%

void yyerror(const char *msg) {
  err_fatal("%s\n", msg);
}
