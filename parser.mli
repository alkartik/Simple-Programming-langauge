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

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Interpreter.program
val goal :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Interpreter.goal
