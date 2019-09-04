type binop = 
    | Plus
    | Minus
    | Mul
    | Div
    | Mod
    | Eq
    | Neq
    | More
    | Less
    | Morequ
    | Lessequ
    | And
    | Or

type unop = 
    | Plus
    | Minus
    | Neg

type data_type =
    | Int
    | Byte
    | IntArr
    | ByteArr

type const = 
    | Int of int
    | Char of int
    | True
    | False

type r_type = 
    | Data_type of data_type 
    | Proc

type ast =
    | Program of ast
    | Func_def of string*ast list option*r_type*ast list*ast 
    | Fpar_def of string*data_type
    | Fpar_def_ref of string*data_type
    | Var_def of string*data_type
    | Var_def_arr of string*data_type*int
    | Func_call of string*ast list option
    | If of ast*ast
    | If_Else of ast*ast*ast
    | While of ast*ast
    | Return of ast option
    | Assign of ast*ast
    | Unop of unop*ast
    | Binop of ast*binop*ast
    | Const of const
    | Lvalue of lvalue
    | Compound of ast list
    | Empty

and lvalue = 
    | Variable of string (*name*)
    | Arr of string*ast 
    | Literal of int list (*string literal*)


