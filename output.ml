open Lexer;;
open Parser;;
open Interpreter;;
exception Wrong 

let rec checkProgram (prog) = match prog with
 | [] -> true
| (Fact(Head(a)))::xs | (Rule(Head(a), _))::xs -> match a with
        A("_eq", _) 
      -> raise Not_found
      | _ -> checkProgram xs
;;


let rec solve_goal (prog) (g) (unif) (vars) =
  let solve_atomic_formula (a1) (a2) (unif) =
    let s1 = subst_atom unif a1 in 
    let s2 = subst_atom unif a2 in
    let xy = mgu_atom s1 s2 in
    compose unif xy
  in
  match g with
      Goals([]) -> (
        printSolution (getSolution unif vars);
        flush stdout;
        Printf.printf "\n";
        (false, [])
      )
    | Goals(a::gs) -> match a with
        | _ ->
          let rec iter prog' = match prog' with
             |  [] -> (false, [])
            | cl::ps -> match cl with
                Fact(Head(a')) -> (
                  try
                    let u = (solve_atomic_formula a' a unif) in
                    match (solve_goal (change_Prolog2 prog a) (Goals(gs)) u vars) with
                        (true, u') -> (true, u')
                      | _ -> iter ps
                  with NOT_UNIFIABLE -> iter ps
                )
              | Rule(Head(a'), B(al)) -> (
                  try
                    let u = (solve_atomic_formula a' a unif) in
                    let new_p = List.append al gs in
                    match (solve_goal (change_Prolog2 prog a) (Goals(new_p)) u vars) with
                        (true, u') -> (true, u')
                      | _ -> iter ps
                  with NOT_UNIFIABLE -> iter ps
                )
        in iter prog
;;


let interpret_goal (prog) (g) = solve_goal prog g [] (vars_goal g)
              ;;


let run_program filename =
  let fstream = open_in filename in
  let init_prog = Parser.program Lexer.read (Lexing.from_channel fstream) in
  let _ = checkProgram init_prog in
  let prog = change_Prolog init_prog 1 in
  print_string "Running\n";
  try
    while true do
      print_string "->>>";
      let line = read_line() in
      match line with
      | "quit" -> exit 0
      | _ ->
        let g = Parser.goal Lexer.read (Lexing.from_string line) in
        match interpret_goal prog g with
        | (true, _) -> print_string "true.\n"
        | (false, _) -> print_string "false.\n"
    done
  with
  | e -> Printf.printf "Error: %s\n" (Printexc.to_string e)

let _ = run_program Sys.argv.(1)
