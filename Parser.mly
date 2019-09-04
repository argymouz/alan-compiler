%{
open Ast

let parse_error s =
	print_endline s;
	flush stdout

%}

%token<int> T_const
%token<int> T_const_char_
%token<string> T_id 
%token<int list> T_string
%token 
	T_byte T_int T_eof T_true T_false T_if T_else T_while
	T_proc T_reference T_return
	T_eq T_neq T_less T_more T_lessequ T_morequ T_assign
	T_plus T_minus T_mul T_div T_mod
	T_neg T_and T_or
	T_lparen T_rparen T_lbrack T_rbrack T_lbrace T_rbrace
	T_com T_col T_semicol



%left T_or
%left T_and
%left T_plus 
%left T_minus
%left T_mul 
%left T_div 
%left T_mod
%left unary_SIGN
%left unary_NEG


%nonassoc below_ELSE
%nonassoc T_else

%start<Ast.ast> program	 

%%

program		: func_def T_eof {Ast.Program($1)}

func_def	: T_id T_lparen fpar_list? T_rparen T_col r_type_ local_def* compound_stmt 
		{ Ast.Func_def($1,$3,$6,$7,Ast.Compound($8)) }

fpar_list	: fpar_def {$1::[] } 
		| fpar_list T_com fpar_def {$1@[$3] }

fpar_def 	: T_id T_col data_type_ { Ast.Fpar_def($1,$3)}
		| T_id T_col T_reference data_type_arr_ { Ast.Fpar_def_ref($1,$4)}

data_type_	: T_int { Ast.Int }
		| T_byte { Ast.Byte }

data_type_arr_	: data_type_ { $1 }
		| T_int T_lbrack T_rbrack { Ast.IntArr}
		| T_byte T_lbrack T_rbrack {Ast.ByteArr}


r_type_		: data_type_ { Ast.Data_type($1) }
		| T_proc { Ast.Proc }

local_def	: func_def { $1 }
		| var_def { $1 }

var_def		: T_id T_col data_type_ T_semicol { Ast.Var_def($1,$3) }
		| T_id T_col data_type_ T_lbrack T_const T_rbrack T_semicol {Ast.Var_def_arr($1,$3,$5) }

stmt		: T_semicol {Ast.Empty }
		| l_value T_assign expr T_semicol {Ast.Assign($1,$3)}
		| compound_stmt {Ast.Compound($1) }
		| func_call T_semicol {$1 }
		| T_while T_lparen cond T_rparen stmt {Ast.While($3,$5)}
		| T_return expr? T_semicol {Ast.Return($2)}
		| T_if T_lparen cond T_rparen stmt T_else stmt {Ast.If_Else($3,$5,$7)}
		| T_if T_lparen cond T_rparen stmt %prec below_ELSE {Ast.If($3,$5)} 

compound_stmt	: T_lbrace stmt* T_rbrace { $2 }

func_call	: T_id T_lparen expr_list? T_rparen {Ast.Func_call($1,$3)}

expr_list	: expr {$1::[] }
		| expr_list T_com expr {$1@[$3] }

unary_op	: T_plus {Ast.Plus }
		| T_minus {Ast.Minus }

expr		: T_const {Ast.Const(Ast.Int($1)) }
		| T_const_char_ {Ast.Const(Ast.Char($1))}
		| l_value { $1 }
		| T_lparen expr T_rparen { $2 }
		| func_call { $1 }
		| unary_op expr %prec unary_SIGN {Ast.Unop($1,$2) }
		| expr T_plus expr {Ast.Binop($1,Ast.Plus,$3) }
		| expr T_minus expr {Ast.Binop($1,Ast.Minus,$3) }
		| expr T_mul expr {Ast.Binop($1,Ast.Mul,$3) }
		| expr T_div expr {Ast.Binop($1,Ast.Div,$3) }
		| expr T_mod expr {Ast.Binop($1,Ast.Mod,$3) }

l_value		: T_id {Ast.Lvalue(Ast.Variable($1)) }
		| T_id T_lbrack expr T_rbrack {Ast.Lvalue(Ast.Arr($1,$3)) }
		| T_string {Ast.Lvalue(Ast.Literal($1)) }

compare_op	: T_eq {Ast.Eq }
		| T_neq {Ast.Neq }
		| T_less {Ast.Less }
		| T_more {Ast.More }
		| T_lessequ {Ast.Lessequ }
		| T_morequ {Ast.Morequ }

unary_logic_op	: T_neg { Ast.Neg }

cond 		: T_true {Ast.Const(Ast.True) }
		| T_false {Ast.Const(Ast.False) }
		| T_lparen cond T_rparen { $2 }
		| expr compare_op expr {Ast.Binop($1,$2,$3) }
		| unary_logic_op cond %prec unary_NEG {Ast.Unop($1,$2) }
		| cond T_and cond {Ast.Binop($1,Ast.And,$3) }
		| cond T_or cond {Ast.Binop($1,Ast.Or,$3) }
