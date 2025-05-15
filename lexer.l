%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
//int yylineno = 1;
%}

%%

"--".*                          { /* yorum satırı */ }   

[0-9]+\.[0-9]+                  { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+                          { yylval.ival = atoi(yytext); return INT; }

\"([^\\\"\n]|\\.)*\"            { yylval.sval = strdup(yytext); return STRING; }

[a-zA-Z_][a-zA-Z0-9_]*          {
                                  yylval.sval = strdup(yytext);
                                  /* Anahtar kelimeleri ayırt */
                                  if (strcmp(yytext, "ve") == 0) return AND;
                                  else if (strcmp(yytext, "veya") == 0) return OR;
                                  else if (strcmp(yytext, "degil") == 0) return NOT;

                                  else if (strcmp(yytext, "eger") == 0) return IF;
                                  else if (strcmp(yytext, "ise") == 0) return THEN;
                                  else if (strcmp(yytext, "degilseEger") == 0) return ELSE;

                                  else if (strcmp(yytext, "dongu") == 0) return WHILE;
                                  else if (strcmp(yytext, "iken") == 0) return WHILECOND;
                                  else if (strcmp(yytext, "neki") == 0) return ENDWHILE;

                                  else if (strcmp(yytext, "yazdir") == 0) return PRINT;
                                  else if (strcmp(yytext, "yazdirln") == 0) return PRINTLN;
                                  else if (strcmp(yytext, "deger") == 0) return VALUE;

                                  else if (strcmp(yytext, "fonk") == 0) return FUNC;
                                  else if (strcmp(yytext, "knof") == 0) return ENDFUNC;
                                  else if (strcmp(yytext, "dondur") == 0) return RETURN;

                                  else if (strcmp(yytext, "daire_ciz") == 0) return DRAW_CIRCLE;
                                  else if (strcmp(yytext, "cizgi_ciz") == 0) return DRAW_LINE;
                                  else if (strcmp(yytext, "daire_renk") == 0) return CIRCLE_COLOR;
                                  else if (strcmp(yytext, "cizgi_renk") == 0) return LINE_COLOR;
                                  else if (strcmp(yytext, "ucgen_ciz") == 0) return DRAW_TRIANGLE;
                                  else if (strcmp(yytext, "ucgen_renk") == 0) return TRIANGLE_COLOR;
                                  else if (strcmp(yytext, "dikdortgen_ciz") == 0) return DRAW_RECTANGLE;

                                  else if (strcmp(yytext, "tus_basildi") == 0) return KEY_PRESSED;
                                  else if (strcmp(yytext, "TUS_YUKARI") == 0) return KEY_UP;
                                  else if (strcmp(yytext, "TUS_ASAGI") == 0) return KEY_DOWN;
                                  else if (strcmp(yytext, "TUS_SOLA") == 0) return KEY_LEFT;
                                  else if (strcmp(yytext, "TUS_SAGA") == 0) return KEY_RIGHT;

                                  else return ID;
                              }

"<->"                            { return ASSIGN; }
"="                             { return EQ; }
"<>"                            { return NEQ; }
"<="                            { return LE; }
">="                            { return GE; }
"<"                             { return LT; }
">"                             { return GT; }

"+"                             { return PLUS; }
"-"                             { return MINUS; }
"*"                             { return MUL; }
"/"                             { return DIV; }
"%"                             { return MOD; }
"^"                             { return POW; }

"("            { return '('; }
")"            { return ')'; }
","            { return ','; }

[\n]+                            { yylineno++; }
[ \t\r]+                        { /* boşlukları yoksay */ }

.                               { return *yytext; }

%%

int yywrap(void) {
    return 1;
}
