(* working code *)

type variable = string
type constant = string
type term = V of variable  | Atomic of constant * (term list) 
type atomic_formula = A of constant * (term list)
type head = Head of atomic_formula
type body = B of atomic_formula list
type clause = Fact of head | Rule of head * body
type program = clause list
type goal = Goals of atomic_formula list

open Stdlib
exception NotFound
exception NOT_UNIFIABLE

let member x s = List.mem x s;;

let rec unification s1 s2 =
  match s1 with
      [] -> s2
  | h::t ->
      if member h s2 then
          unification t s2
      else
          h :: (unification t s2);;


let rec union l1 l2 =
  let rec union_helper acc = function
    | [] -> List.rev_append acc l2  
    | x::xs ->
        if List.mem x l2 then union_helper acc xs  
        else union_helper (x :: acc) xs  
  in
  union_helper [] l1
;;


let rec change_term i = function
  | V v -> V (string_of_int i ^ v)
  | Atomic (s, l) -> Atomic (s, List.map (change_term i) l)

let rec change_atom i = function
  | A (s, l) -> A (s, List.map (change_term i) l)

let rec change_Prolog (prog) (i) = 
  let rec modify_clause i = function
  | Fact (Head a) -> Fact (Head (change_atom i a))
  | Rule (Head a, B l) -> Rule (Head (change_atom i a), B (List.map (change_atom i) l))
  in 
  match prog with
   | [] -> []
  | cl::ps -> (modify_clause i cl)::change_Prolog ps (i+1)
;;

let rec change_Prolog2 (prog) (A(s, t))=
  let rec modify_clause i = function
  | Fact (Head a) -> Fact (Head (change_atom i a))
  | Rule (Head a, B l) -> Rule (Head (change_atom i a), B (List.map (change_atom i) l))
  in 
   match prog with
  |  [] -> []
  | cl::ps -> match cl with Fact(Head(A(s', _))) | Rule(Head(A(s', _)), _) ->
                if s = s' then (modify_clause 0 cl)::change_Prolog2 ps (A(s, []))
                else cl::change_Prolog2 ps (A(s, []))
;; 


let rec vars_goal (Goals(g)) = 
  let rec vars_term (t) =
    match t with
    | Atomic(s, l) -> List.fold_left (fun acc t -> union acc (vars_term t)) [] l
    | V(x) -> [x]
  in
  let vars_formula (A(s, l)) = vars_term (Atomic(s, l)) in 
  List.fold_left union [] (List.map vars_formula g)
;;


let rec subst (s) (t) =
  match t with
  | Atomic (s', l) -> Atomic (s', List.map (subst s) l)
  | V x ->
      match List.find_opt (fun (v, _) -> v = x) s with
      | Some (_, value) -> value
      | None -> t
;;


let subst_atom sub  f=
  match f with
  | A (pred, trm_lst) ->
      A (pred, List.map (fun t -> subst sub t) trm_lst);;


let rec variableInTerm (v) (t) =
  match t with
      V(x) -> x = v
    | Atomic(s, l) -> List.exists (variableInTerm v) l
;;


let rec compose s1 s2 =
    let rec compose_with_acc s1 s2 acc =
      if List.length s1 = 0 && List.length s2 = 0 then acc
      else if List.length s1 > 0 && List.length s2 = 0 then unification acc s1
      else if List.length s1 = 0 && List.length s2 > 0 then unification acc s2
      else
        let (v1, t1) = List.hd s1 in
        let (v2, t2) = List.hd s2 in
        let rest1 = List.tl s1 in
        let rest2 = List.tl s2 in
        if variableInTerm v2 t1 then
          compose_with_acc rest1 rest2 (unification acc [(v1, subst [(v2, t2)] t1); (v2, t2)])
        else
          compose_with_acc rest1 rest2 (unification [(v1, t1); (v2, t2)] acc)
    in
    compose_with_acc s1 s2 []
  ;;
  

let rec mgu_term (t1) (t2) =
  match (t1, t2) with
    |  (V(x), V(y)) -> if x <> y then [(x, V(y))]
                      else []
                      | (V(x), Atomic(s, l)) -> if variableInTerm x t2 = false  then  [(x, t2)]
                      else raise NOT_UNIFIABLE    
    | (Atomic(s, l), V(x)) -> if variableInTerm x t1  = false then [(x, t1)]
                            else raise NOT_UNIFIABLE
    | (Atomic (f, trm_lst_1), Atomic (g, trm_lst_2)) ->
    if (f = g) && (List.length trm_lst_1 = List.length trm_lst_2)
    then
        List.fold_left2 (fun acc c1 c2 -> unification acc (mgu_term c1 c2)) [] trm_lst_1 trm_lst_2
    else
        raise NOT_UNIFIABLE;;      
;;



let mgu_atom f1 f2 =
  match (f1, f2) with
  (A (f, trm_lst_1), A (g, trm_lst_2)) ->
      if (f = g) && (List.length trm_lst_1 = List.length trm_lst_2)
      then
          List.fold_left2 (fun acc c1 c2 -> unification acc (mgu_term c1 c2)) [] trm_lst_1 trm_lst_2
      else
          raise NOT_UNIFIABLE;;
                    

let occurs l v =
  try
    List.find (fun (key, _) -> key = v) l
  with
  | Not_found -> raise NotFound


let rec print_term_list (tl) = match tl with
   |  [] -> Printf.printf ""
  | [t] -> print_term t
  | t::tls -> (
      print_term t;
      Printf.printf ",";
      print_term_list tls;
    )
and print_term (t) = match t with
  |  V(v) -> Printf.printf " %s " v
  | Atomic(s, []) -> Printf.printf " %s " s
  | Atomic(s, l) -> (
      Printf.printf " %s ( " s;
      print_term_list l;
      Printf.printf " ) ";
    )
;;

let rec printSolution (unif) = match unif with
    [] -> Printf.printf "true. "
  | [(v, t)] -> (
      Printf.printf "%s =" v;
      print_term t;
    )
  | (v, t)::xs -> (
      Printf.printf "%s =" v;
      print_term t;
      Printf.printf ", ";
      printSolution xs;
    )
;;


let rec getSolution (unif) (vars) = match vars with
    [] -> []
  | v::vs ->
      try (occurs unif v)::getSolution unif vs
      with NotFound -> getSolution unif vs
;;

let rec print_atom (A(s, l)) = match l with
    [] -> Printf.printf " %s " s
  | [t] -> Printf.printf " %s ( " s;
          print_term t;
          Printf.printf " ) "
  | t::ts -> Printf.printf " %s ( " s;
             print_term t;
             Printf.printf ", ";
             print_term_list ts;
             Printf.printf " ) "


let rec print_goal (Goals(g)) = match g with
    [] -> Printf.printf ""
  | [a] -> print_atom a
  | a::as' -> print_atom a;
              Printf.printf ", ";
              print_goal (Goals(as')) 
              
let rec print_clause (c) = match c with
    Fact(Head(a)) -> print_atom a;
    | Rule(Head(a), B(b)) -> print_atom a;
                              Printf.printf " :- ";
                              print_goal (Goals(b)) ;;



