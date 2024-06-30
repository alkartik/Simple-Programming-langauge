{
  open Parser;;
  exception InvalidToken of char ;;
}

let alpha_num = ['A'-'Z' 'a'-'z' '0'-'9' '_']
let space = [' ' '\t' '\n']+
let cap = ['A'-'Z']
let low = ['a'-'z']
let var = cap(alpha_num*)
let cons = low(alpha_num*)  

rule read = parse
   | eof                   {EOF}
  | space                    {read lexbuf}
  | var as v              {VAR(v)}
  | cons as c             {CONS(c)} 
  | '('                   {LPAREN}
  | ')'                   {RPAREN}
  | '['                   {LBRACE}
  | ']'                   {RBRACE}
  | ','                   {COMMA}
  | '='                   {EQ}
  | '+'                   {PLUS}
  | '/'                   {DIV}
  | '!'                   {CUT}
   | '-'                   {MINUS}
  | '*'                   {MULT}
  | '.'                   {PERIOD}
  | ":-"                  {COND}
  | _ as s                {raise (InvalidToken s)}



