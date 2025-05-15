/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT = 258,                     /* INT  */
    FLOAT = 259,                   /* FLOAT  */
    ID = 260,                      /* ID  */
    STRING = 261,                  /* STRING  */
    ASSIGN = 262,                  /* ASSIGN  */
    PLUS = 263,                    /* PLUS  */
    MINUS = 264,                   /* MINUS  */
    MUL = 265,                     /* MUL  */
    DIV = 266,                     /* DIV  */
    MOD = 267,                     /* MOD  */
    POW = 268,                     /* POW  */
    EQ = 269,                      /* EQ  */
    NEQ = 270,                     /* NEQ  */
    LT = 271,                      /* LT  */
    GT = 272,                      /* GT  */
    LE = 273,                      /* LE  */
    GE = 274,                      /* GE  */
    AND = 275,                     /* AND  */
    OR = 276,                      /* OR  */
    NOT = 277,                     /* NOT  */
    IF = 278,                      /* IF  */
    THEN = 279,                    /* THEN  */
    ELSE = 280,                    /* ELSE  */
    WHILE = 281,                   /* WHILE  */
    WHILECOND = 282,               /* WHILECOND  */
    ENDWHILE = 283,                /* ENDWHILE  */
    FUNC = 284,                    /* FUNC  */
    ENDFUNC = 285,                 /* ENDFUNC  */
    RETURN = 286,                  /* RETURN  */
    DRAW_CIRCLE = 287,             /* DRAW_CIRCLE  */
    DRAW_LINE = 288,               /* DRAW_LINE  */
    DRAW_RECTANGLE = 289,          /* DRAW_RECTANGLE  */
    DRAW_TRIANGLE = 290,           /* DRAW_TRIANGLE  */
    CIRCLE_COLOR = 291,            /* CIRCLE_COLOR  */
    LINE_COLOR = 292,              /* LINE_COLOR  */
    RECTANGLE_COLOR = 293,         /* RECTANGLE_COLOR  */
    TRIANGLE_COLOR = 294,          /* TRIANGLE_COLOR  */
    PRINT = 295,                   /* PRINT  */
    PRINTLN = 296,                 /* PRINTLN  */
    VALUE = 297,                   /* VALUE  */
    KEY_PRESSED = 298,             /* KEY_PRESSED  */
    KEY_UP = 299,                  /* KEY_UP  */
    KEY_DOWN = 300,                /* KEY_DOWN  */
    KEY_LEFT = 301,                /* KEY_LEFT  */
    KEY_RIGHT = 302,               /* KEY_RIGHT  */
    LOWER_THAN_ELSE = 303          /* LOWER_THAN_ELSE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "parser.y"

    int ival;
    float fval;
    char* sval;

#line 118 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
