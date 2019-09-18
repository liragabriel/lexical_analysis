%{
#include <stdio.h>
%}

ID  [a-zA-z][a-zA-Z0-9]*
NUM [0-9]+("."[0-9]+)?

%%

{ID}+   {printf("TKN_ID: %s\n", yytext);}
{NUM}+  {printf("TKN_NUM: %s\n", yytext);}

%%

void main(){
    yylex();
}

// TKN_ID[a-zA-z][a-zA-Z0-9]*
// TKN_NUM[0-9]+("."[0-9]+)?
// TKN_COS"cos"
// TKN_SEN"sen"
// TKN_ATRIB"="
// TKN_PTOVIRGULA";"
// TKN_MULT"*"
// TKN_DIV"/"
// TKN_MAIS"+"
// TKN_MENOS"-"
// TKN_PAA"("
// TKN_PAF")"

// para compilar
//     flex lexico_scan.l
//     gcc lex.yy.c -o scanner -lfl -lm○
// para rodar
//     ./scanner
