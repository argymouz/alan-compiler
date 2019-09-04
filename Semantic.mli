open Ast

type node_type = 
    | Stmt  (*entoli, aka Void*)
    | Cond  (*sinthiki*)
    | Int   
    | Byte
    | IntArr
    | ByteArr
    

type typed_ast = 
    | Program_t of typed_ast*node_type
    | Func_def_t of string*typed_ast list option*r_type*typed_ast list*typed_ast*node_type
    | Fpar_def_t of string*data_type*node_type
    | Fpar_def_ref_t of string*data_type*node_type
    | Var_def_t of string*data_type*node_type
    | Var_def_arr_t of string*data_type*int*node_type
    | Func_call_t of string*int*typed_ast list option*node_type
    | If_t of typed_ast*typed_ast*node_type
    | If_Else_t of typed_ast*typed_ast*typed_ast*node_type
    | While_t of typed_ast*typed_ast*node_type
    | Return_t of typed_ast option*node_type
    | Assign_t of typed_ast*typed_ast*node_type
    | Unop_t of unop*typed_ast*node_type
    | Binop_t of typed_ast*binop*typed_ast*node_type
    | Const_t of const*node_type
    | Lvalue_t of typed_lvalue*int*int*node_type
    | Compound_t of typed_ast list*node_type
    | Empty_t


and typed_lvalue =
    | Variable of string
    | Arr of string*typed_ast
    | Literal of int list

val typing : ast -> typed_ast

