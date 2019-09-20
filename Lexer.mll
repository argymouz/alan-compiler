(* a lexer for the Alan programming language *)

{
open Format
open Parser
open Error
let incr_linenum lexbuf = 
	let pos=lexbuf.Lexing.lex_curr_p in 
	lexbuf.Lexing.lex_curr_p <- { pos with 
	Lexing.pos_lnum = pos.Lexing.pos_lnum + 1;
	Lexing.pos_bol= pos.Lexing.pos_cnum;
	}
;; 
let lnum lexbuf = 
	let pos=lexbuf.Lexing.lex_curr_p in 
		pos.Lexing.pos_lnum;
;;
}
let digit = ['0'-'9']
let hex_digit = ['0'-'9' 'a'-'f']
let letter = ['a'-'z' 'A'-'Z']
let white  = [' ' '\t' '\r']
let esc_seq = '\\' ( [ 'n' 't' 'r' '0' '\\' '\'' '\"' ] | ('x' hex_digit hex_digit))
let printable_char = [^ '\'' '\"' '\\' '\n' '\t' '\r' ] 



rule lexer = parse
	| white+ {lexer lexbuf}
	| '\n' {incr_linenum lexbuf; lexer lexbuf }
	| "--" [^ '\n']* '\n' { incr_linenum lexbuf; lexer lexbuf } 
	| "(*" { comments 0 lexbuf }  
	| "*)" { error "Line: %d Closing nonexistent comment\n" (lnum lexbuf); lexer lexbuf }  
	| "byte" { T_byte }
	| "int" { T_int }

	| "true" { T_true }
	| "false" { T_false }
	| "if" { T_if }
	| "else" { T_else }
	| "while" { T_while }

	| "proc" { T_proc }
	| "reference" { T_reference }
	| "return" { T_return }

	| "==" { T_eq }
	| "!=" { T_neq }
	| '<' { T_less }
	| '>' { T_more }
	| "<=" { T_lessequ }
	| ">=" { T_morequ }
	| '=' { T_assign }

	| '+' { T_plus }
	| '-' { T_minus }
	| '*' { T_mul }
	| '/' { T_div }
	| '%' { T_mod }

	| '!' { T_neg }
	| '&' { T_and }
	| '|' { T_or }

	| '(' { T_lparen }
	| ')' { T_rparen }
	| '[' { T_lbrack }
	| ']' { T_rbrack }
	| '{' { T_lbrace }
	| '}' { T_rbrace }

	| ',' { T_com }
	| ':' { T_col }
	| ';' { T_semicol }

	| digit+ as num { T_const(int_of_string(num)) }
	| '\'' { parse_char lexbuf } 
	| '\"' { parse_string [] lexbuf }
	| letter ((letter)|(digit)|('_'))* as id { T_id(id) }
	| white+ { lexer lexbuf }
	| eof { T_eof }
	| _ as c { error "Line: %d Invalid character: '%c' (ascii: %d)\n" (lnum lexbuf)  c (Char.code c); lexer lexbuf }

(* parse to ascii and store as int*)

and parse_char = parse
	| '\\' 'x' digit digit '\'' as c {T_const_char_(int_of_char(c.[2])*16+int_of_char(c.[3]))}
	| '\\' 'n' '\'' {T_const_char_(10)}
	| '\\' 't' '\'' {T_const_char_(9)}
	| '\\' 'r' '\'' {T_const_char_(13)}
	| '\\' '0' '\'' {T_const_char_(0)}
	| '\\' '\\' '\'' {T_const_char_(92)}
	| '\\' '\'' '\'' {T_const_char_(39)}
	| '\\' '\"'  '\'' {T_const_char_(34)}
	| printable_char '\'' as c {T_const_char_(int_of_char(c.[0]))}

and parse_string buffer = parse
	| '\\' 'x' digit digit as c {let tmp=int_of_char(c.[2])*16+int_of_char(c.[3]) in parse_string (buffer@[tmp]) lexbuf}
	| '\\' 'n' {parse_string (buffer@[10]) lexbuf}
	| '\\' 't' {parse_string (buffer@[9]) lexbuf}
	| '\\' 'r' {parse_string (buffer@[13]) lexbuf}
	| '\\' '0' {parse_string (buffer@[0]) lexbuf}
	| '\\' '\\' {parse_string (buffer@[92]) lexbuf}
	| '\\' '\'' {parse_string (buffer@[39]) lexbuf}
	| '\\' '\"' {parse_string (buffer@[34]) lexbuf}
	| printable_char as c {parse_string (buffer@[int_of_char(c)]) lexbuf}
	| '\n' { error "Line: %d Multiline string not permitted" (lnum lexbuf); parse_string buffer lexbuf }
	| '\"' { let tmp=buffer in T_string(tmp)}


and comments level = parse
	| "*)" { if level == 0 then lexer lexbuf
	else comments (level - 1) lexbuf }
	| "(*" { comments (level + 1) lexbuf }
	| '\n' {incr_linenum lexbuf; comments level lexbuf;}
	| _ { comments level lexbuf }
	| eof { error "comments are not closed, nesting level is: (%d)\n" (level) ; T_eof }
