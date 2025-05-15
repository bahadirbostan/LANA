%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

void yyerror(const char *s);
int yylex();
extern int yylineno;
%}

%union {
    int ival;
    float fval;
    char* sval;
}

%token <ival> INT
%token <fval> FLOAT
%token <sval> ID STRING

%token ASSIGN
%token PLUS MINUS MUL DIV MOD POW
%token EQ NEQ LT GT LE GE
%token AND OR NOT

%token IF THEN ELSE
%token WHILE WHILECOND ENDWHILE
%token FUNC ENDFUNC RETURN
%token DRAW_CIRCLE
%token DRAW_LINE
%token DRAW_RECTANGLE
%token DRAW_TRIANGLE
%token CIRCLE_COLOR
%token LINE_COLOR
%token RECTANGLE_COLOR
%token TRIANGLE_COLOR
%token PRINT      
%token PRINTLN    
%token VALUE

%token KEY_PRESSED KEY_UP KEY_DOWN KEY_LEFT KEY_RIGHT

%token '(' ')' ','

%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%left OR
%left AND
%left EQ NEQ
%left LT GT LE GE
%left PLUS MINUS
%left MUL DIV MOD
%right POW
%right NOT

%type <ival> expr

%start program

%%

program:
    statements
    ;

statements:
    statements statement
    | 
    ;

statement:
    ID ASSIGN expr                    { printf("Atama: %s = %d\n", $1, $3); }
    | ID '(' args ')'                { printf("Fonksiyon cagiri: %s\n", $1); }
    | DRAW_CIRCLE expr expr expr     { printf("Daire ciziliyor\n"); }
    | DRAW_LINE expr                 { printf("Cizgi ciziliyor\n"); }
    | DRAW_RECTANGLE expr expr expr expr { printf("Dikdortgen ciziliyor\n"); }
    | DRAW_TRIANGLE                  { printf("Ucgen ciziliyor\n"); }
    | CIRCLE_COLOR expr              { printf("Daire rengi ayarlandi\n"); }
    | LINE_COLOR expr                { printf("Cizgi rengi ayarlandi\n"); }
    | RECTANGLE_COLOR expr           { printf("Dikdortgen rengi ayarlandi\n"); }
    | TRIANGLE_COLOR expr            { printf("Ucgen rengi ayarlandi\n"); }
    | PRINT expr                     { printf("%d", $2); }
    | PRINTLN expr                   { printf("%d\n", $2); }
    | VALUE expr                     { printf("Deger aliniyor: %d\n", $2); }
    | IF expr THEN statement %prec LOWER_THAN_ELSE { printf("Kosullu ifade (if-then)\n"); }
    | IF expr THEN statement ELSE statement  { printf("Kosullu ifade\n"); }
    | WHILE expr WHILECOND statements ENDWHILE { printf("Dongu calisiyor\n"); }
    | FUNC ID params ':' statements RETURN expr ENDFUNC { printf("Fonksiyon tanimi: %s\n", $2); }
    | IF KEY_PRESSED keycode THEN statement { printf("Tus kontrolu\n"); }
    ;

params:
   
    | ID
    | ID ID
    ;

args:
   
    | arg_list
    ;

arg_list:
    expr
    | arg_list ',' expr
    ;

keycode:
    KEY_UP
    | KEY_DOWN
    | KEY_LEFT
    | KEY_RIGHT
    ;

expr:
    expr PLUS expr        { $$ = $1 + $3; }
    | expr MINUS expr     { $$ = $1 - $3; }
    | expr MUL expr       { $$ = $1 * $3; }
    | expr DIV expr       { $$ = $1 / $3; }
    | expr MOD expr       { $$ = $1 % $3; }
    | expr POW expr       { $$ = (int)pow($1, $3); }
    | expr EQ expr        { $$ = ($1 == $3); }
    | expr NEQ expr       { $$ = ($1 != $3); }
    | expr LT expr        { $$ = ($1 < $3); }
    | expr GT expr        { $$ = ($1 > $3); }
    | expr LE expr        { $$ = ($1 <= $3); }
    | expr GE expr        { $$ = ($1 >= $3); }
    | expr AND expr       { $$ = $1 && $3; }
    | expr OR expr        { $$ = $1 || $3; }
    | NOT expr            { $$ = !$2; }
    | INT                 { $$ = $1; }
    | FLOAT               { $$ = (int)$1; }
    | STRING              { printf("%s", $1); free($1); $$ = 0; }
    | ID                  { $$ = 0;}
    | '(' expr ')'        { $$ = $2; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata: Satır %d: %s\n", yylineno, s);
}
