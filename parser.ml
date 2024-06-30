type token =
  | VAR of (string)
  | CONS of (string)
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | COMMA
  | EQ
  | PERIOD
  | CUT
  | COND
  | PLUS
  | MINUS
  | MULT
  | DIV
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
    open Interpreter;;
# 24 "parser.ml"
let yytransl_const = [|
  259 (* LPAREN *);
  260 (* RPAREN *);
  261 (* LBRACE *);
  262 (* RBRACE *);
  263 (* COMMA *);
  264 (* EQ *);
  265 (* PERIOD *);
  266 (* CUT *);
  267 (* COND *);
  268 (* PLUS *);
  269 (* MINUS *);
  270 (* MULT *);
  271 (* DIV *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* VAR *);
  258 (* CONS *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\003\000\003\000\004\000\004\000\002\000\006\000\
\006\000\005\000\005\000\005\000\007\000\007\000\009\000\008\000\
\008\000\008\000\008\000\008\000\000\000\000\000"

let yylen = "\002\000\
\001\000\002\000\001\000\002\000\002\000\004\000\002\000\001\000\
\003\000\001\000\004\000\003\000\001\000\003\000\002\000\003\000\
\001\000\001\000\004\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\017\000\000\000\000\000\000\000\001\000\
\021\000\000\000\000\000\000\000\000\000\020\000\022\000\000\000\
\000\000\000\000\000\000\000\000\015\000\002\000\004\000\005\000\
\000\000\000\000\000\000\007\000\000\000\000\000\000\000\016\000\
\000\000\012\000\009\000\000\000\000\000\000\000\006\000\014\000\
\019\000"

let yydgoto = "\003\000\
\009\000\015\000\010\000\011\000\016\000\017\000\029\000\013\000\
\014\000"

let yysindex = "\026\000\
\001\000\013\255\000\000\000\000\008\255\021\255\015\255\000\000\
\000\000\029\000\013\255\253\254\022\255\000\000\000\000\028\255\
\031\255\021\255\039\255\040\255\000\000\000\000\000\000\000\000\
\013\255\021\255\013\255\000\000\041\255\036\255\021\255\000\000\
\037\255\000\000\000\000\000\000\021\255\043\255\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\025\255\000\000\000\000\000\000\
\000\000\000\000\048\000\000\000\000\000\000\000\000\000\042\255\
\000\000\000\000\254\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\045\255\000\000\000\000\
\000\000\000\000\000\000\030\255\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\000\000\039\000\000\000\002\000\248\255\229\255\250\255\
\000\000"

let yytablesize = 262
let yytable = "\020\000\
\008\000\018\000\012\000\038\000\018\000\024\000\018\000\025\000\
\018\000\040\000\018\000\030\000\012\000\004\000\005\000\006\000\
\033\000\007\000\035\000\034\000\021\000\004\000\019\000\006\000\
\030\000\007\000\001\000\002\000\022\000\026\000\030\000\010\000\
\018\000\010\000\027\000\010\000\011\000\019\000\011\000\028\000\
\011\000\031\000\037\000\032\000\036\000\039\000\041\000\003\000\
\013\000\023\000\008\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\004\000\005\000\006\000\000\000\007\000"

let yycheck = "\006\000\
\000\000\004\001\001\000\031\000\007\001\009\001\009\001\011\001\
\011\001\037\000\003\001\018\000\011\000\001\001\002\001\003\001\
\025\000\005\001\027\000\026\000\006\001\001\001\002\001\003\001\
\031\000\005\001\001\000\002\000\000\000\008\001\037\000\007\001\
\008\001\009\001\007\001\011\001\007\001\008\001\009\001\009\001\
\011\001\003\001\007\001\004\001\004\001\009\001\004\001\000\000\
\004\001\011\000\009\001\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\003\001\255\255\005\001"

let yynames_const = "\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  COMMA\000\
  EQ\000\
  PERIOD\000\
  CUT\000\
  COND\000\
  PLUS\000\
  MINUS\000\
  MULT\000\
  DIV\000\
  EOF\000\
  "

let yynames_block = "\
  VAR\000\
  CONS\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    Obj.repr(
# 19 "parser.mly"
                                         ([])
# 188 "parser.ml"
               : Interpreter.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'clause_list) in
    Obj.repr(
# 20 "parser.mly"
                                        (_1)
# 195 "parser.ml"
               : Interpreter.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'clause) in
    Obj.repr(
# 24 "parser.mly"
                                          ([_1])
# 202 "parser.ml"
               : 'clause_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'clause) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'clause_list) in
    Obj.repr(
# 25 "parser.mly"
                                        ((_1)::_2)
# 210 "parser.ml"
               : 'clause_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atom) in
    Obj.repr(
# 29 "parser.mly"
                                            (Fact(Head(_1)))
# 217 "parser.ml"
               : 'clause))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'atom_list) in
    Obj.repr(
# 30 "parser.mly"
                                          (Rule(Head(_1), B(_3)))
# 225 "parser.ml"
               : 'clause))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'atom_list) in
    Obj.repr(
# 34 "parser.mly"
                                          (Goals(_1))
# 232 "parser.ml"
               : Interpreter.goal))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 38 "parser.mly"
                                         ([_1])
# 239 "parser.ml"
               : 'atom_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atom_list) in
    Obj.repr(
# 39 "parser.mly"
                                        ((_1)::_3)
# 247 "parser.ml"
               : 'atom_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 43 "parser.mly"
                                        (A(_1, []))
# 254 "parser.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'term_list) in
    Obj.repr(
# 44 "parser.mly"
                                                (A(_1, _3))
# 262 "parser.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 45 "parser.mly"
                                        (A("_eq", [_1; _3]))
# 270 "parser.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'term) in
    Obj.repr(
# 49 "parser.mly"
                                        ([_1])
# 277 "parser.ml"
               : 'term_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'term) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'term_list) in
    Obj.repr(
# 50 "parser.mly"
                                        ((_1)::_3)
# 285 "parser.ml"
               : 'term_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 55 "parser.mly"
                                                (Atomic("empty", []))
# 291 "parser.ml"
               : 'list))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'term) in
    Obj.repr(
# 60 "parser.mly"
                                                (_2)
# 298 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 61 "parser.mly"
                                        (V(_1))
# 305 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 62 "parser.mly"
                                        (Atomic(_1, []))
# 312 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'term_list) in
    Obj.repr(
# 63 "parser.mly"
                                                (Atomic(_1, _3))
# 320 "parser.ml"
               : 'term))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'list) in
    Obj.repr(
# 64 "parser.mly"
                                        (_1)
# 327 "parser.ml"
               : 'term))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry goal *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Interpreter.program)
let goal (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : Interpreter.goal)
