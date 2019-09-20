open Llvm
open Lexing
open Parser
open Ast
open Format
open Semantic
open Identifier
open Types
open Symbol
open Error
open Codegen

let main =
 let cin = stdin in
 let lexbuf = Lexing.from_channel cin in
 try
    let ast = Parser.program Lexer.lexer lexbuf in
    let t_ast = typing ast in 
	let the_module = Codegen.top_codegen t_ast Sys.argv.(1) in
	print_module "output.ll" the_module;
  with Parser.Error ->
    Error.error "%a syntax error\n" Error.print_position (Error.position_point lexbuf.Lexing.lex_curr_p);
    Printf.printf "Compilation FAILED :(\n";
    exit 1
