open Ast
open Format
open Error
open Identifier
open Types
open Symbol

let name_stack = Stack.create ()

let place_stack = Stack.create ()

let depth_ptr = ref 0

let register_functions() = (* parameter places are useless for these functions, since none of them perform calls to other functions *)
	
	let p = newFunction (id_make "extend") true in
	openScope TYPE_int p;
	let p1=newParameter (id_make "b") TYPE_byte PASS_BY_VALUE p true 0 in
	endFunctionHeader p TYPE_int;
	ignore p1;
	closeScope();		
	
	let p = newFunction (id_make "shrink") true in
	openScope TYPE_byte  p;
	let p1=newParameter (id_make "i") TYPE_int PASS_BY_VALUE p true 0 in
	endFunctionHeader p TYPE_byte;
	ignore p1;	
	closeScope();	
	
	let p = newFunction (id_make "strlen") true in
	openScope TYPE_int p;
	let p1=newParameter (id_make "s") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 0 in
	endFunctionHeader p TYPE_int;
	ignore p1;		
	closeScope();

	let p = newFunction (id_make "strcmp") true in
	openScope TYPE_int p;
	let p1=newParameter (id_make "s1") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 0 in
	let p2=newParameter (id_make "s2") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 1 in
	endFunctionHeader p TYPE_int;
	ignore p1; ignore p2;		
	closeScope();
	
	let p = newFunction (id_make "strcpy") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "trg") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 0 in
	let p2=newParameter (id_make "src") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 1 in
	endFunctionHeader p TYPE_proc;
	ignore p1; ignore p2;		
	closeScope();

	let p = newFunction (id_make "strcat") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "trg") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 0 in
	let p2=newParameter (id_make "src") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 1 in
	endFunctionHeader p TYPE_proc;
	ignore p1; ignore p2;		
	closeScope();

	let p = newFunction (id_make "writeInteger") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "n") TYPE_int PASS_BY_VALUE p true 0 in
	endFunctionHeader p TYPE_proc;
	ignore p1;
	closeScope();		

	let p = newFunction (id_make "readInteger") true in
	openScope TYPE_int p;
	endFunctionHeader p TYPE_int;
	closeScope();	

	let p = newFunction (id_make "writeByte") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "n") TYPE_byte PASS_BY_VALUE p true 0 in
	endFunctionHeader p TYPE_proc;
	ignore p1;
	closeScope();		

	let p = newFunction (id_make "readByte") true in
	openScope TYPE_byte p;
	endFunctionHeader p TYPE_byte;
	closeScope();

	let p = newFunction (id_make "writeChar") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "n") TYPE_byte PASS_BY_VALUE p true 0 in
	endFunctionHeader p TYPE_proc;
	ignore p1;
	closeScope();		

	let p = newFunction (id_make "readChar") true in
	openScope TYPE_byte p;
	endFunctionHeader p TYPE_byte;
	closeScope();	

	let p = newFunction (id_make "writeString") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "s") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 0 in
	endFunctionHeader p TYPE_proc;
	ignore p1;	
	closeScope();	

	let p = newFunction (id_make "readString") true in
	openScope TYPE_proc p;
	let p1=newParameter (id_make "n") TYPE_int PASS_BY_VALUE p true 0 in
	let p2=newParameter (id_make "s") (TYPE_array(TYPE_byte,0)) PASS_BY_REFERENCE p true 1 in
	endFunctionHeader p TYPE_proc;
	ignore p1; ignore p2;
	closeScope();	

type node_type = 
	| Stmt  (*entoli, aka Void*)
	| Cond  (*sinthiki*)
	| Int   
	| Byte
	| IntArr
	| ByteArr

type typed_ast = 
	| Program_t of typed_ast * node_type
	| Func_def_t of string * typed_ast list option * r_type * typed_ast list * typed_ast * node_type
	| Fpar_def_t of string * data_type * node_type
	| Fpar_def_ref_t of string * data_type * node_type
	| Var_def_t of string * data_type * node_type
	| Var_def_arr_t of string * data_type * int * node_type
	| Func_call_t of string * int * typed_ast list option * node_type
	| If_t of typed_ast * typed_ast * node_type
	| If_Else_t of typed_ast * typed_ast * typed_ast * node_type
	| While_t of typed_ast * typed_ast * node_type
	| Return_t of typed_ast option * node_type
	| Assign_t of typed_ast * typed_ast * node_type
	| Unop_t of unop * typed_ast * node_type
	| Binop_t of typed_ast * binop * typed_ast * node_type
	| Const_t of const * node_type
	| Lvalue_t of typed_lvalue * int * int * bool * node_type
	| Compound_t of typed_ast list * node_type
	| Empty_t 
 
and typed_lvalue =
	| Variable of string
	| Arr of string * typed_ast
	| Literal of int list

let rec typing node = 
	match node with
	| Program(ast1) ->
	(
		initSymbolTable 256;
		register_functions();
		match ast1 with
		| Func_def(name, par_l, ret_type, loc_def_l, comp_body) -> 
			if name = "main" then (
                                let x = Program_t(typing ast1, Stmt) in
                                x
                        )
			else ( (* if main is not proc, its return value has to be saved somewhere *)
                                match ret_type with
                                | Proc -> 
                                (
                                        let newmain = Func_def("main", (Some []), Proc, [ast1], Compound([Func_call(name, None)])) in
                                        Program_t(typing newmain, Stmt)
                                )
                                | Data_type(Int) ->
                                (
                                        let newmain = Func_def("main", (Some []), Proc, Var_def("X", Int)::[ast1], Compound([Assign(Lvalue(Variable("X")), Func_call(name, None))])) in
                                        Program_t(typing newmain, Stmt)
                                )
                                | Data_type(Byte) ->
                                (
                                        let newmain = Func_def("main", (Some []), Proc, Var_def("X", Byte)::[ast1], Compound([Assign(Lvalue(Variable("X")), Func_call(name, None))])) in
                                        Program_t(typing newmain, Stmt)
                                )
                                | _ -> raise (Failure "main has an invalid return type\n")

                       )
		| _ -> raise (Failure "Top function is no function\n")
	)
	| Func_def(name, par_l, ret_type, loc_def_l, comp_body) ->
	(
		(
                        if (Stack.is_empty (name_stack)) then ignore(Stack.push name name_stack)
			else
			(
				let prev_top = Stack.top name_stack in
                                let curr_top = String.concat "_" [prev_top; name] in
				ignore(Stack.push curr_top name_stack);
			)
		);
		let place = place_ptr name in (
			Stack.push place place_stack;
			let p = newFunction (id_make name) true in
			begin
				match ret_type with
                                | Proc -> openScope TYPE_proc p;
				| Data_type(Int) -> openScope TYPE_int p;
				| Data_type(Byte) -> openScope TYPE_byte p;
				| _ -> error "Invalid ret type"
			end;
			let par_l_t = do_all_opt(typing, par_l) in
			begin
				match ret_type with
				| Proc -> endFunctionHeader p TYPE_proc;
				| Data_type(Int) -> endFunctionHeader p TYPE_int;
				| Data_type(Byte) -> endFunctionHeader p TYPE_byte;
				| _ -> error "Invalid ret type"
			end;
			let loc_def_l_t = do_all(typing, loc_def_l) in
			let extra_ret_node = (
				match ret_type with
				| Data_type(Int) -> Return(Some (Const(Int(0))))
				| Data_type(Byte) -> Return(Some (Const(Char(0))))
				| Proc -> Return(None)
				| _ -> raise (Failure "Invalid ret type\n")
			)
			in
			let comp_body_with_extra_ret = (
				match comp_body with
				| Compound(stmt_list) -> Compound(stmt_list@[extra_ret_node])
				| _ -> raise (Failure "Compound body is not compound body!\n") 
			)
			in
			let comp_body_t = typing comp_body_with_extra_ret in
			(
				closeScope();
				let llvm_name = Stack.pop name_stack in
                                ignore(Stack.pop place_stack);
				Func_def_t(llvm_name, par_l_t, ret_type, loc_def_l_t, comp_body_t, Stmt)
			)
		)
	)
	| Fpar_def(name, d_type) ->  
		begin
			let i = Stack.top place_stack in
			(
				let p = deopt((!currentScope).sco_func_entry) in
				match d_type with
				| Int -> let u = newParameter(id_make name) TYPE_int PASS_BY_VALUE p true !i in 
                                        ignore u;
                                        ignore(i := !i + 1);
				| Byte -> let u = newParameter(id_make name) TYPE_byte PASS_BY_VALUE p true !i in
                                        ignore u;
                                        ignore(i := !i + 1);
				| IntArr -> error "Non-ref array param"
				| ByteArr -> error "Non-ref array param"
			)
		end;
		Fpar_def_t(name, d_type, Stmt)
	| Fpar_def_ref(name, d_type) -> 
		begin
			let i = Stack.top place_stack in
			(
				let p = deopt((!currentScope).sco_func_entry) in
				match d_type with
				| Int ->
				(
					let u = newParameter(id_make name) TYPE_int PASS_BY_REFERENCE p true !i in 
					ignore(u);
                                        ignore(i := !i + 1);
				)
				| Byte ->
				(
					let u = newParameter(id_make name) TYPE_byte PASS_BY_REFERENCE p true !i in
					ignore(u);
                                        ignore(i := !i + 1);
				)
				| IntArr ->
				(
					let u = newParameter(id_make name) (TYPE_array(TYPE_int, 0)) PASS_BY_REFERENCE p true !i in
					ignore(u);
                                        ignore(i := !i + 1);
				)
				| ByteArr ->
				(
					let u = newParameter(id_make name) (TYPE_array(TYPE_byte, 0)) PASS_BY_REFERENCE p true !i in
					ignore(u);
                                        ignore(i := !i + 1);
				)
			)
		end;
		Fpar_def_ref_t(name, d_type, Stmt)
	| Var_def(name, d_type) -> 
		begin
			let i = Stack.top place_stack in
			(
				match d_type with
				| Int -> let u = newVariable(id_make name) TYPE_int true !i in
                                        ignore u;
                                        ignore(i := !i + 1);
				| Byte -> let u = newVariable(id_make name) TYPE_byte true !i in
                                        ignore u;
                                        ignore(i := !i + 1);
				| _ -> error "Fatal error"
			)
		end;
		Var_def_t(name,d_type,Stmt)
	| Var_def_arr(name,d_type,size) ->
		begin
			let i = Stack.top place_stack in
			(
				match d_type with
				| Int -> let u = newVariable(id_make name) (TYPE_array(TYPE_int, size)) true !i in 
                                        ignore(u);
                                        ignore(i := !i + 1);
				| Byte -> let u = newVariable(id_make name) (TYPE_array(TYPE_byte, size)) true !i in 
                                        ignore(u);
                                        ignore(i := !i + 1);
				|_ -> error "Fatal error"
			)
		end;
		Var_def_arr_t(name, d_type, size, Stmt)
	| Func_call(name, arg_l) ->
		let func = lookupEntry(id_make name) LOOKUP_ALL_SCOPES false in
		begin
			match func.entry_info with
			| ENTRY_function(fn) ->
				begin
					let name_lst = String.split_on_char '_' (Stack.top name_stack) in
					let llvm_name_lst = create_llvm_name_lst name_lst (func.entry_scope.sco_nesting) [] in
					let llvm_name = String.concat "_" (llvm_name_lst@[name]) in
					let arg_l_t = do_all_opt(typing, arg_l) in

					check_types_l_opt_ref(arg_l_t, fn.function_paramlist);

					let ret = fn.function_result in (
                                                (if ((!currentScope).sco_nesting - 1 < func.entry_scope.sco_nesting) then (ignore(depth_ptr := 0);)
                                                else (ignore(depth_ptr := (!currentScope).sco_nesting - func.entry_scope.sco_nesting);));
					        match ret with
					        | TYPE_int -> Func_call_t(llvm_name, !depth_ptr, arg_l_t, Int)
					        | TYPE_byte -> Func_call_t(llvm_name, !depth_ptr, arg_l_t, Byte)
					        | TYPE_proc -> Func_call_t(llvm_name, !depth_ptr, arg_l_t, Stmt)
					        | _ -> error "Invalid return type"; Empty_t
                                        )
				end
			| _ -> error "Something else used as func"; Empty_t
		end
	| If(cond, oldstmt) -> 
		let stmt = (
			match oldstmt with 
			| Compound(_) -> oldstmt
			| _ -> Compound([oldstmt])
		) in
		let cond_t = typing cond in
		let stmt_t = typing stmt in
		check_types_l(cond_t::[stmt_t], Cond::[Stmt]);
		If_t(cond_t, stmt_t, Stmt)
	| If_Else(cond, oldstmt1, oldstmt2) -> 
		let stmt1 = (
			match oldstmt1 with 
			| Compound(_) -> oldstmt1
			| _ -> Compound([oldstmt1])
		) in
		let stmt2 = (
			match oldstmt2 with 
			| Compound(_) -> oldstmt2
			| _ -> Compound([oldstmt2])
		) in
		let cond_t = typing cond in
		let stmt1_t = typing stmt1 in
		let stmt2_t = typing stmt2 in
		check_types_l(cond_t::stmt1_t::[stmt2_t], Cond::Stmt::[Stmt]);
		If_Else_t(cond_t, stmt1_t, stmt2_t, Stmt)
	| While(cond, oldstmt) -> 
		let stmt = (
			match oldstmt with 
			| Compound(_) -> oldstmt
			| _ -> Compound([oldstmt])
		) in
		let cond_t = typing cond in
		let stmt_t = typing stmt in
		check_types_l(cond_t::[stmt_t], Cond::[Stmt]);
		While_t(cond_t, stmt_t, Stmt)
	| Return(retu) ->
	(
		match retu with
		| Some ret ->
		(
			let retu_t = typing ret in
			let fn_t = (!currentScope).sco_ret_type in
			check_types(retu_t, my_typ(fn_t));
			Return_t(Some retu_t, Stmt)
		)
		| None ->
		(
			let fn_t = (!currentScope).sco_ret_type in
			if (fn_t = TYPE_proc) then Return_t(None, Stmt)
			else
			(
				 error "Proc returns non-void"; Empty_t
			)
		)
	)
	| Unop(unop, expr) -> 
	(
		let expr_t = typing expr in
		let un_type = get_type expr_t in
		match un_type with
		| Cond -> 
		(
			if unop = Neg then Unop_t(unop,expr_t, Cond)
			else
			(
				error "Illegal Unary Op"; Empty_t
			)
		)
		| Int -> 
		(
			if ((unop = Plus) || (unop = Minus)) then Unop_t(unop, expr_t, Int)
			else
			(
				error "Illegal Unary Op"; Empty_t
			)
		)
		| _ -> error "Illegal Unary Arg"; Empty_t
	)
	| Binop(expr1, binop, expr2) -> 
		begin
			let expr1_t = typing expr1 in
			let expr2_t = typing expr2 in
			let bi_t1 = get_type expr1_t in
			let bi_t2 = get_type expr2_t in	
			match binop with
			| Plus | Minus | Mul | Div | Mod ->
			(
				match (bi_t1, bi_t2) with 
				| (Int, Int) -> Binop_t(expr1_t, binop,expr2_t, Int)
				| (Byte, Byte) -> Binop_t(expr1_t, binop,expr2_t, Byte)
				| _ -> error "Arithmetic binop type mismatch"; Empty_t
			)
			| Eq | Neq | More | Less | Morequ | Lessequ ->
				begin
					match (bi_t1, bi_t2) with 
					| (Int, Int) -> Binop_t(expr1_t, binop, expr2_t, Cond)
					| (Byte, Byte) -> Binop_t(expr1_t, binop, expr2_t, Cond)
					| _ -> error "Arithmetic compare type mismatch"; Empty_t
				end
			| And | Or ->
				begin
					match (bi_t1, bi_t2) with 
					| (Cond, Cond) -> Binop_t(expr1_t, binop, expr2_t, Cond)
					| _ -> error "Logic binop mismatch"; Empty_t
				end		
		end
	| Assign(expr1, expr2) ->
	(
		let expr1_t = typing expr1 in
		let expr2_t = typing expr2 in
		let bi_t2 = get_type expr2_t in	
		match(expr1_t, bi_t2) with
		| (Lvalue_t(Variable(_), _, _, _, Int), Int) -> Assign_t(expr1_t, expr2_t, Stmt)
		| (Lvalue_t(Variable(_), _, _, _, Byte), Byte) -> Assign_t(expr1_t, expr2_t, Stmt)
		| (Lvalue_t(Arr(_), _, _, _, Byte), Byte) -> Assign_t(expr1_t, expr2_t, Stmt)
		| (Lvalue_t(Arr(_),_,_,_,Int),Int) -> Assign_t(expr1_t, expr2_t, Stmt)
		| (Lvalue_t(Literal(_), _, _, _, _), _) -> error "You may not assign to a string"; Empty_t
		| _ -> error "Illegal Assign"; Empty_t
	)
	| Const(value) ->
	(
		match value with
		| Int(_) -> Const_t(value, Int)
		| Char(_) -> Const_t(value, Byte) (*STRING->CHAR*)
		| True -> Const_t(True, Cond)
		| False -> Const_t(False, Cond)
	)
	| Lvalue(lvalue) ->
	(
		match lvalue with
		| Variable(name) ->
		(
			let lvalue_t = Variable(name) in 	
			let entr = lookupEntry(id_make name) LOOKUP_ALL_SCOPES false in
			let depth = (!currentScope).sco_nesting - entr.entry_scope.sco_nesting in
			let place = entr.frame_place in
			match entr.entry_info with 
			| ENTRY_variable(varinf) ->
			(
				match varinf.variable_type with
				|TYPE_int ->Lvalue_t(lvalue_t,depth,place,false,Int)
				|TYPE_byte ->Lvalue_t(lvalue_t,depth,place,false,Byte)
				|TYPE_array(TYPE_int,_) -> Lvalue_t(lvalue_t, depth, place, false, IntArr)
				|TYPE_array(TYPE_byte,_) -> Lvalue_t(lvalue_t, depth, place, false, ByteArr)
				|_ -> error "Invalid variable type"; Empty_t
			)
			| ENTRY_parameter(parinf) ->
			(
                                let flag = (parinf.parameter_mode = PASS_BY_REFERENCE) in
			        match parinf.parameter_type with
				|TYPE_int ->Lvalue_t(lvalue_t, depth, place, flag, Int)
				|TYPE_byte ->Lvalue_t(lvalue_t, depth, place, flag, Byte)
				|TYPE_array(TYPE_int,_) -> Lvalue_t(lvalue_t, depth, place, true, IntArr)
				|TYPE_array(TYPE_byte,_) -> Lvalue_t(lvalue_t, depth, place, true, ByteArr)
				|_ -> error "Invalid variable type"; Empty_t
			)
			| _ -> error "Undefined variable"; Empty_t
		)
		| Arr(name, pos) ->
		(
			let pos_t = typing pos in
			if get_type(pos_t) <> Int
			then begin error "Non-int index"; Empty_t end else
			let lvalue_t = Arr(name, typing pos) in
			let entr = lookupEntry(id_make name) LOOKUP_ALL_SCOPES false in
			let depth = (!currentScope).sco_nesting - entr.entry_scope.sco_nesting in
			let place = entr.frame_place in
			match entr.entry_info with 
			| ENTRY_variable(varinf) ->
			(
				match varinf.variable_type with
				| TYPE_array(TYPE_int, _) -> Lvalue_t(lvalue_t, depth, place, false, Int)
				| TYPE_array(TYPE_byte, _) -> Lvalue_t(lvalue_t, depth, place, false, Byte)
				| _ -> error "Invalid variable type"; Empty_t
			)
			| ENTRY_parameter(parinf) ->
			(
			        match parinf.parameter_type with
				| TYPE_array(TYPE_int,_) -> Lvalue_t(lvalue_t, depth, place, true, Int)
				| TYPE_array(TYPE_byte,_) -> Lvalue_t(lvalue_t, depth, place, true, Byte)
				|_ -> error "Invalid array type"; Empty_t
			)
			| _ -> error "Illegal array name"; Empty_t
		)
		| Literal(str) ->
			let lvalue_t = Literal(str) in
			Lvalue_t(lvalue_t, 0, 0, false, ByteArr)
	)
	| Compound(stmt_l) ->
		(*check everyone has type Stmt*) 
		let stmt_l_t = do_all(typing, stmt_l) in
		let check_stmt(stmt) =
		(
			if get_type(stmt) = Stmt then ()
			else error "Unused non-void in statement"
		)
		in
		let rec check_stmt_l(stmt_l) =
			match stmt_l with
			| xl::rest -> check_stmt(xl); check_stmt_l(rest)
			| [] -> ()
		in
		begin
			check_stmt_l(stmt_l_t);
			Compound_t(stmt_l_t, Stmt)
		end
	| Empty -> Empty_t

and create_llvm_name_lst name_lst depth out_lst =
	match depth with
	| 0 -> List.rev out_lst
	| _ ->
	(
		match name_lst with
		| h::t -> create_llvm_name_lst t (depth - 1) (h::out_lst)
		| _ -> raise (Failure "This should never happen!")
	)

and place_ptr name =
	match name with
	| "main" -> ref 0
	| _ -> ref 1

and get_type node =
	match node with
	| Program_t(_, _) -> Stmt
	| Func_def_t(_, _, _, _, _, _) -> Stmt
	| Fpar_def_t(_, _, _) -> Stmt
	| Fpar_def_ref_t(_, _, _) -> Stmt 
	| Var_def_t(_, _, _) -> Stmt
	| Var_def_arr_t(_, _, _, _) -> Stmt
	| Func_call_t(_, _, _, t) -> t
	| If_t(_, _, _) -> Stmt
    	| If_Else_t(_, _, _, _) -> Stmt
    	| While_t(_, _, _) -> Stmt
    	| Return_t(_, _) -> Stmt
	| Assign_t(_, _, _) -> Stmt
    	| Unop_t(_, _, t) -> t 
   	| Binop_t(_, _, _, t) -> t
    	| Const_t(_, t) -> t
    	| Lvalue_t(_, _, _, _, t) -> t
    	| Compound_t(_, _) -> Stmt
    	| Empty_t -> Stmt

and deopt(a) = 
	match a with
	| None -> raise (Failure "Should never happen")
	| Some a -> a

and deopt_l(a) = 
	match a with
	| None -> []
	| Some a -> a

and do_all(fn,list) =
	match list with
	| [] -> []
	| x::rest -> let temp=fn(x) in temp::do_all(fn,rest)

and do_all_opt(fn,list) = 
	match list with 
	| None -> None
	| Some list -> Some (do_all (fn,list))

and check_types(x,y) =
	let x_t=get_type x in
	if (x_t=y) then ()
	else error "Checked types are different"

and check_types_l(xl,yl) =
	match (xl,yl) with
	| ([],[]) -> ();
	| (x::xr,y::yr) ->
	check_types(x,y); check_types_l(xr,yr)
	| _ -> error "Type checking lists not of same size"

and my_typ typ =
	match typ with
	| TYPE_int -> Int
	| TYPE_byte -> Byte
	| TYPE_array(TYPE_byte,_) -> ByteArr
	| TYPE_array(TYPE_int,_) -> IntArr
	| TYPE_proc -> Stmt
	| _ -> error "improper my_typ usage"; Stmt
 
and check_types_l_opt_ref(real_par_l_opt,typ_par_l)=
	let real_par_l = deopt_l(real_par_l_opt) in
	check_types_l_ref(real_par_l,typ_par_l)		

and check_types_l_ref(real_par_l, typ_par_l) =
(
        match (real_par_l,typ_par_l) with
	| ([],[]) -> ();
	| (x::xr, y::yr) ->
	(
		match y.entry_info with
		| ENTRY_parameter(parinf) ->
		if parinf.parameter_mode = PASS_BY_VALUE then
			let x_t = get_type x in
			if (x_t = my_typ(parinf.parameter_type)) then check_types_l_ref(xr,yr)
			else error "Typ and real param types dont match"
		else if parinf.parameter_mode = PASS_BY_REFERENCE then
		(
			match x with
			| Lvalue_t(_, _, _, _, typ) ->
				if (typ = my_typ(parinf.parameter_type)) then check_types_l_ref(xr, yr)
				else error "Typ and real param types dont match"

			| _ -> error "Param passed by reference is not L-VALUE!!"
		)
		else error "Impossible cant be neither"
		| _ -> error "Impossible, typ param is not param"
	)
	| _ -> error "Amount of typ and real params is not equal"
)
