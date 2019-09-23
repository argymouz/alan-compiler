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
open Filename

let optimization = ref false
let intermediate = ref false
let final = ref false
let main = 
begin
let speclist = [("-O", Arg.Set optimization, "Enables optimization");
("-i", Arg.Set intermediate, "Produces intermediate code from stdin");
("-f", Arg.Set final, "Produces final code from stdin");] 
in let usage_msg="A compiler for the Alan Language"
in let compiler_func input_file =
begin
	let cin = open_in input_file in
        let basefile = basename input_file in
        let dir = dirname input_file in
        let truename = remove_extension basefile in
        let immfile = concat dir (truename^".imm") in
	let asmfile = concat dir (truename^".asm") in	
        let exefile = concat dir truename in
        let lexbuf = Lexing.from_channel cin in
	try
   		let ast = Parser.program Lexer.lexer lexbuf in
    		let t_ast = typing ast in 
                let optflag = match !optimization with false -> "no" | true -> "yes" in
		let the_module = Codegen.top_codegen t_ast optflag in
                print_module immfile the_module;
                (        
                match (Sys.command("/usr/lib/llvm-6.0/bin/llc "^immfile^" -o "^asmfile)) with
                0 -> exit (Sys.command("clang "^asmfile^" lib.a -o "^exefile))
                | a -> exit a
                )
        with Parser.Error ->
    		Error.error "%a syntax error\n" Error.print_position (Error.position_point lexbuf.Lexing.lex_curr_p);
        exit 1
end
in Arg.parse speclist compiler_func usage_msg;
(match (!intermediate)||(!final) with
false -> ()
|true -> (        
	let lexbuf = Lexing.from_channel stdin in
	try
   		let ast = Parser.program Lexer.lexer lexbuf in
    		let t_ast = typing ast in 
                let optflag = match !optimization with false -> "no" | true -> "yes" in
		let the_module = Codegen.top_codegen t_ast optflag in
                print_module "output.ll" the_module;
		(
		match(!final) with
        	false -> exit (Sys.command("cat output.ll"))
        	| true -> (        
                match (Sys.command("/usr/lib/llvm-6.0/bin/llc output.ll -o output.s")) with
                0 -> exit (Sys.command("cat output.s"))
                | a -> exit a
                )
        	)
        with Parser.Error ->
    		Error.error "%a syntax error\n" Error.print_position (Error.position_point lexbuf.Lexing.lex_curr_p);
	
        )
        
)
end
(*


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

*)
