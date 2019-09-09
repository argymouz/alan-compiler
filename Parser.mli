
(* The type of tokens. *)

type token = 
  | T_while
  | T_true
  | T_string of (int list)
  | T_semicol
  | T_rparen
  | T_return
  | T_reference
  | T_rbrack
  | T_rbrace
  | T_proc
  | T_plus
  | T_or
  | T_neq
  | T_neg
  | T_mul
  | T_morequ
  | T_more
  | T_mod
  | T_minus
  | T_lparen
  | T_lessequ
  | T_less
  | T_lbrack
  | T_lbrace
  | T_int
  | T_if
  | T_id of (string)
  | T_false
  | T_eq
  | T_eof
  | T_else
  | T_div
  | T_const_char_ of (int)
  | T_const of (int)
  | T_com
  | T_col
  | T_byte
  | T_assign
  | T_and

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val program: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Ast.ast)
