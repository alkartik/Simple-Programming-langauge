%{
    open Interpreter;;
%}

%token <string> VAR CONS
%token LPAREN RPAREN LBRACE RBRACE COMMA EQ PERIOD CUT COND PLUS MINUS MULT DIV EOF

%left COMMA
%nonassoc EQ 
%nonassoc PERIOD

%start program goal
%type <Interpreter.program> program
%type <Interpreter.goal> goal

%%

program:
  |  EOF                                 {[]}
  | clause_list EOF                     {$1}
;

clause_list:
   |  clause                              {[$1]}
  | clause clause_list                  {($1)::$2}
;

clause:
   |  atom PERIOD                           {Fact(Head($1))}
  | atom COND atom_list PERIOD            {Rule(Head($1), B($3))}
;

goal:
    atom_list PERIOD                      {Goals($1)}
;

atom_list:
   | atom                                {[$1]}
  | atom COMMA atom_list                {($1)::$3}
;

atom:
  | CONS                                {A($1, [])}
  | CONS LPAREN term_list RPAREN                {A($1, $3)}
  | term EQ term                        {A("_eq", [$1; $3])}
;

term_list:
    term                                {[$1]}
  | term COMMA term_list                {($1)::$3}
;


list:
    LBRACE RBRACE                               {Atomic("empty", [])}
;


term:
    LPAREN term RPAREN                          {$2}
  | VAR                                 {V($1)}
  | CONS                                {Atomic($1, [])}
  | CONS LPAREN term_list RPAREN                {Atomic($1, $3)}
  | list                                {$1}
;

