%{
#include <stdio.h>
%}

ID  [a-zA-z][a-zA-Z0-9]*
NUM [0-9]+("."[0-9]+)?

%%

cos     {printf("TKN_COS: %s\n", yytext);}
sen     {printf("TKN_SEN: %s\n", yytext);}
"="     {printf("TKN_ATRIB: %s\n", yytext);}
";"     {printf("TKN_PTOVIRGULA: %s\n", yytext);}
"*"     {printf("TKN_MULT: %s\n", yytext);}
"/"     {printf("TKN_DIV: %s\n", yytext);}
"+"     {printf("TKN_MAIS: %s\n", yytext);}
"-"     {printf("TKN_MENOS: %s\n", yytext);}
"("     {printf("TKN_PAA: %s\n", yytext);}
")"     {printf("TKN_PAF: %s\n", yytext);}
{ID}+   {printf("TKN_ID: %s\n", yytext);}
{NUM}+  {printf("TKN_NUM: %s\n", yytext);}

%%

void lines() {
    FILE *arquivo;
    arquivo = fopen("palavras.txt", "r");

    int lines = 0;
    char c;

    for (c = getc(arquivo); c != EOF; c = getc(arquivo))
        if (c == '\n')
            lines = lines + 1;
    printf("\n%i linhas analisadas\n\n", lines+1);
}

int main() {
    FILE *arquivo;
    arquivo = fopen("palavras.txt", "r");

    if ( arquivo != NULL ) {
        yyin = arquivo;
        lines();
    }
    else {
	    yyin = stdin;
    }
    yylex();
}
