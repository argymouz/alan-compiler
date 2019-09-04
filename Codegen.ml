open Llvm
open Llvm_target
open Llvm_scalar_opts
open Llvm_all_backends
open Ast
open Semantic
open Format
open Error
open Identifier
open Types

let context = global_context ()
let the_module = create_module context "alan"
let the_fpm = PassManager.create_function the_module
let builder = builder context

let mybyte = integer_type context 8
let myint = integer_type context 16
let mybyteref = pointer_type mybyte
let myintref = pointer_type myint
let myvoid = void_type context

let ret_flag = ref 0

let type_stack = Stack.create ()

let create_entry_block_alloca the_function var_name var_type =
	let builder = builder_at context (instr_begin (entry_block the_function)) in
	build_alloca var_type var_name builder

let create_entry_block_array_alloca the_function arr_name arr_type arr_size = 
	let builder = builder_at context (instr_begin (entry_block the_function)) in
	build_array_alloca arr_type arr_size arr_name builder

let rec top_codegen tree optimization = (
	match tree with
	| Program_t(program, dtyp) ->
		declare_runtimes the_module;
		ignore(Llvm_all_backends.initialize());

		(
			if optimization = "yes" then
                		(
				add_memory_to_register_promotion the_fpm;
				add_instruction_combination the_fpm;
				add_reassociation the_fpm;
				add_gvn the_fpm;	
				add_cfg_simplification the_fpm;
			)
			else ()
		);

		ignore(PassManager.initialize the_fpm);
		ignore(codegen_search_frames ());
		let prog = codegen program in
		the_module
	| _ -> raise (Failure "TOP_CODEGEN CALLED FOR NON_PROGRAM NODE\n")
)
	
and codegen tree = 
	match tree with
	| Program_t(program, dtyp) -> 
		raise (Failure "CODEGEN CALLED FOR PROGRAM NODE\n")
	| Func_def_t(name, par_l, ret_type, loc_def_l, comp_body, _) ->
	(
		let par_arr = opt_list_to_array par_l in (* convert parameter list to array *)
		let par_typ_arr1 = Array.map extract_param_type par_arr in (* extract parameter types *)
		let par_typ_arr = add_frame_ptr_typ name par_typ_arr1 in (* for every function except main, add an extra element that will work as an access link *)
		let ft = function_type (ret_ll_typ ret_type) par_typ_arr in (* now we know the function's type *)
		let f = declare_function name ft the_module in (* and we can declare it *)
		let par_names1 = Array.map extract_param_name par_arr in (* extract parameter names *)
		let par_names = add_frame_ptr_name name par_names1 in (* add the extra element's name, if it exists *)
		let param_arr = params f in (
			Array.iteri (fun i a ->
				let n = Array.get par_names i in (* set the parameters' names to the llvm code *)
				set_value_name n a;
			) param_arr;
			let type_lst = extract_loc_var_def_type loc_def_l [] in (* extract the types of local variables *)
			let type_arr = opt_list_to_array type_lst in (* convert list to array *)
			let frame_typ_arr = Array.append par_typ_arr type_arr in (* create the array with the type of the frame *)
			let frame_type = struct_type context frame_typ_arr in (* create the frame *)
			let frame_type_str = string_of_lltype frame_type in
			(
				(
					if (Stack.is_empty type_stack) then (ignore(Stack.push frame_type_str type_stack);)
					else (
						let prev_top = Stack.top type_stack in
                                                let curr_top = String.concat "_" [frame_type_str; prev_top] in
						ignore(Stack.push curr_top type_stack);
                			)
				);
				(*let llvm_fr_str = build_global_string frame_type_str "" builder in*)
				let bb = append_block context "entry" f in (* now create a basic block *)
                                let fr = create_entry_block_alloca f (String.concat "." [name; "fr"]) frame_type in (* allocate the stack frame *)
				(
					init_fr fr param_arr 0 (Array.length param_arr); (* initialize the frame, see the def of the function below *)
					ignore(List.map codegen_loc_fun loc_def_l);
					ignore(codegen_body comp_body fr);
					ignore(Stack.pop type_stack);
					Llvm_analysis.assert_valid_function f;
					let _ = PassManager.run_function f the_fpm in
					f
				)
			)
		)
	)
        | _ -> raise (Failure "This should not happen!\n")

and codegen_body body fr =
	match body with
	| Compound_t(stmt_list, dtyp) ->
	(
		match stmt_list with
		| [] -> const_null myint
		| stmt::stmt_rest ->
		(
			match stmt with
			| Return_t(_, _) -> ret_flag := 1; codegen_body stmt fr
			| _ -> ignore(codegen_body stmt fr); codegen_body (Compound_t(stmt_rest, dtyp)) fr
		)
	)
	| Func_call_t(name, depth, args_l, typ) ->
		let callee = deopt_lookup_function name in
		let args_array = opt_list_to_array args_l in
		let args = Array.mapi (codegen_call callee fr) args_array in
		let search_frames = deopt_lookup_function "search_frames" in
		let parent_frame_ptr = build_call search_frames [| fr; const_int myint depth |] "" builder in
		build_call callee (Array.append [| parent_frame_ptr |] args) "" builder
        | If_t(cond, then_, dtyp) ->
		let cond_val = codegen_body cond fr in
		(*should be bool*)
		let start_bb = insertion_block builder in
		let the_function = block_parent start_bb in
		let then_bb = append_block context "then" the_function in
		position_at_end then_bb builder;
		ret_flag := 0;
		let then_val = codegen_body then_ fr in
		let new_then_bb = insertion_block builder in
		let merge_bb = append_block context "ifcont" the_function in
		position_at_end start_bb builder;
		ignore (build_cond_br cond_val then_bb merge_bb builder);
		position_at_end new_then_bb builder;

		(*NOT ALWAYS NECESSARY*)
		(
			if (!ret_flag = 0) then (ignore (build_br merge_bb builder);)
			else ()
		);
		ret_flag := 0;
		position_at_end merge_bb builder;
		const_null myint
        | If_Else_t(cond, then_, else_, dtyp) ->
		let cond_val = codegen_body cond fr in
		let start_bb = insertion_block builder in
		let the_function = block_parent start_bb in
		let then_bb = append_block context "then" the_function in
		position_at_end then_bb builder;
		ret_flag := 0;
		let then_val = codegen_body then_ fr in
		let tmp1 = (!ret_flag) in
		let new_then_bb = insertion_block builder in

		let merge_bb = append_block context "ifcont" the_function in
		let else_bb = append_block context "else" the_function in
		position_at_end else_bb builder;
		ret_flag := 0;
		let else_val = codegen_body else_ fr in
		let tmp2 = (!ret_flag) in
		let new_else_bb = insertion_block builder in
		position_at_end start_bb builder;
		ignore (build_cond_br cond_val then_bb else_bb builder);
		position_at_end new_then_bb builder;

		(*NOT ALWAYS NECESSARY*)
		(
			if (tmp1 = 0) then (ignore(build_br merge_bb builder);)
			else ()
		);
		ret_flag := 0;
		position_at_end new_else_bb builder;

		(* NOT ALWAYS NECESSARY *)
		(
			if (tmp2 = 0) then (ignore(build_br merge_bb builder);)
			else ()
		);
		ret_flag := 0;
		position_at_end merge_bb builder;
		const_null myint
        | While_t(cond, do_, dtyp) ->
		let start_bb = insertion_block builder in
		let the_function = block_parent start_bb in
		let cond_bb = append_block context "cond" the_function in
		position_at_end cond_bb builder;
		let cond_val = codegen_body cond fr in
		let new_cond_bb = insertion_block builder in
		let after_bb = append_block context "after" the_function in
		let do_bb = append_block context "do" the_function in
		position_at_end do_bb builder;
		ret_flag := 0;
		let do_val = codegen_body do_ fr in
		let new_do_bb = insertion_block builder in
		position_at_end start_bb builder;
		ignore (build_br cond_bb builder);
		position_at_end new_cond_bb builder;
		ignore (build_cond_br cond_val do_bb after_bb builder);
		position_at_end new_do_bb builder;

		(* NOT ALWAYS NECESSARY *)
		(
			if (!ret_flag = 0) then (ignore (build_br cond_bb builder);)
			else ()
		);
		ret_flag := 0;
		position_at_end after_bb builder;
		const_null myint
	| Assign_t(lhs, rhs, dtyp) ->
		let target = codegen_ref lhs fr in
		let source = codegen_body rhs fr in
		build_store source target builder
	| Return_t(ret, dtyp) ->
        (
		match ret with
		| None -> build_ret_void builder
		| Some expr ->
			let tmp = codegen_body expr fr in
			build_ret tmp builder
        )                
	| Unop_t(op, rhs, typ) ->
		let rhs_val = codegen_body rhs fr in (
		match op with
		| Neg -> build_not rhs_val "nottmp" builder
		| Plus -> rhs_val
		| Minus -> build_neg rhs_val "negmp" builder)
        | Binop_t(lhs, op, rhs, typ) ->
		let lhs_val = codegen_body lhs fr in
		let rhs_val = codegen_body rhs fr in (
		match op with
		| Plus -> build_add lhs_val rhs_val "addtmp" builder
		| Minus -> build_sub lhs_val rhs_val "subtmp" builder
		| Mul -> build_mul lhs_val rhs_val "multmp" builder
		| Div -> build_udiv lhs_val rhs_val "divtmp" builder
		| Mod -> build_urem lhs_val rhs_val "modtmp" builder
		| Eq -> build_icmp Icmp.Eq lhs_val rhs_val "eqtmp" builder
		| Neq -> build_icmp Icmp.Ne lhs_val rhs_val "eqtmp" builder
		| More -> build_icmp Icmp.Ugt lhs_val rhs_val "moretmp" builder
		| Less -> build_icmp Icmp.Ult lhs_val rhs_val "lesstmp" builder
		| Morequ -> build_icmp Icmp.Uge lhs_val rhs_val "morequtmp" builder
		| Lessequ -> build_icmp Icmp.Ule lhs_val rhs_val "lessequtmp" builder
		| And -> build_and lhs_val rhs_val "andtmp" builder
		| Or -> build_or lhs_val rhs_val "ortmp" builder
		| _ -> raise (Failure "Binary OP problem in codegen"))
	| Const_t(t, typ) -> (
		match t with
		| Int(value) -> const_int myint value
		| Char(value) -> const_int mybyte value
		| True -> const_int mybyte 1
		| False -> const_int mybyte 0)
	| Lvalue_t(first, depth, place, dtyp) -> (
		match first with
		| Variable(name) ->
		(
			Printf.printf ("1\n");
			let search_frames = deopt_lookup_function "search_frames" in
			let parent_frame_ptr = build_call search_frames [| fr; const_int myint depth |] "" builder in
			let parent_frame = build_load parent_frame_ptr "" builder in
			let v = build_struct_gep parent_frame place "" builder in
			build_load v "loadtmp" builder
		)
		| Arr(name, index) ->
		(
			Printf.printf ("2\n");
			let search_frames = deopt_lookup_function "search_frames" in
			let parent_frame_ptr = build_call search_frames [| fr; const_int myint depth |] "" builder in
			let parent_frame = build_load parent_frame_ptr "" builder in
			let v = build_struct_gep parent_frame place "" builder in
			let index = codegen_body index fr in
			let addr = build_in_bounds_gep v [| index |] "arrtmp" builder in
			build_load addr "load_arr_elem_tmp" builder
		)
		| Literal(charlist) ->
			let string_of_chars chars = (
				let buf = Buffer.create (List.length chars) in (
					List.iter (Buffer.add_char buf) chars;
                       			Buffer.contents buf
                        )) in
			let charlist1 = List.map char_of_int charlist in
			let str = string_of_chars charlist1 in
			let p = build_global_string str "strtmp" builder in
			build_in_bounds_gep p [| const_int myint 0; const_int myint 0 |] "arr_strtmp" builder
		| _ -> raise (Failure "Unimplemented"))
	| Empty_t -> const_null myint
	| _ -> raise (Failure "CODEGEN CALLED FOR PARAM")

and codegen_ref node fr = 
	match node with
        | Lvalue_t(Variable(name), depth, place, _) ->
	(
		Printf.printf ("3\n");
		let search_frames = deopt_lookup_function "search frames" in
		let parent_frame_ptr = build_call search_frames [| fr; const_int myint depth |] "" builder in
		let parent_frame = build_load parent_frame_ptr "" builder in
		build_struct_gep parent_frame place "" builder
	)
        | Lvalue_t(Arr(name,index), depth, place, _) ->
	(
		Printf.printf ("4\n");
		let search_frames = deopt_lookup_function "search frames" in
		let parent_frame_ptr = build_call search_frames [| fr; const_int myint depth |] "" builder in
		let parent_frame = build_load parent_frame_ptr "" builder in
		let v = build_struct_gep parent_frame place "" builder in
		let index = codegen_body index fr in
		build_in_bounds_gep v [| index |] "arrtmp" builder
	)
	| _ -> codegen_body node fr

and codegen_call callee fr i arg =
	let typ_param = type_of((params callee).(i)) in
	let str_param = string_of_lltype(typ_param) in (
	match str_param with
	| "i16" -> (codegen_body arg fr)
	| "i8" -> (codegen_body arg fr)
	| "i16*" -> (codegen_ref arg fr)
	| "i8*" -> (codegen_ref arg fr)
	| _ -> raise (Failure "Illegal typical parameter. CODEGEN_CALL\n"))

and codegen_loc_fun node =
	match node with
	| Func_def_t(_) ->
	(
		ignore(codegen node);
		()
	)
	| _ -> ()

and codegen_search_frames () =
	let ft = function_type (myint) [| myint; myint |] in
	let f = declare_function "search_frames" ft the_module in
	let param_arr = params f in
	(
		set_value_name "fr_first_elem_addr" param_arr.(0);
		set_value_name "depth" param_arr.(1);

		let bb = append_block context "entry" f in
		let cond_val = build_icmp Icmp.Ugt param_arr.(1) (const_int myint 0) "moretmp" builder in
		let start_bb = insertion_block builder in
		let the_function = block_parent start_bb in
		let then_bb = append_block context "then" the_function in
		position_at_end then_bb builder;
		ret_flag := 0;
		let then_val = (
			let fr_first_pos = build_struct_gep param_arr.(0) 0 "" builder in
			let new_fr = build_load fr_first_pos "" builder in
			let new_depth = build_sub param_arr.(1) (const_int myint 1) "" builder in
			build_call f [| new_fr; new_depth |] "" builder
		) in
		let tmp1 = (!ret_flag) in
		let new_then_bb = insertion_block builder in

		let merge_bb = append_block context "ifcont" the_function in
		let else_bb = append_block context "else" the_function in
		position_at_end else_bb builder;
		ret_flag := 0;
		let else_val = (
			param_arr.(0)
		) in
		let tmp2 = (!ret_flag) in
		let new_else_bb = insertion_block builder in
		position_at_end start_bb builder;
		ignore (build_cond_br cond_val then_bb else_bb builder);
		position_at_end new_then_bb builder;

		(*NOT ALWAYS NECESSARY*)
		(
			if (tmp1 = 0) then (ignore (build_br merge_bb builder);)
			else ()
		);
		ret_flag := 0;
		position_at_end new_else_bb builder;

		(*NOT ALWAYS NECESSARY*)
		(
			if (tmp2 = 0) then (ignore (build_br merge_bb builder);)
			else ()
		);
		ret_flag := 0;
		position_at_end merge_bb builder;
		const_null myint
	)

and add_frame_ptr_name name arr =
        match name with
        | "main" -> arr
        | _ -> Array.append [| "fr_ptr" |] arr

and add_frame_ptr_typ name arr =
	match name with
	| "main" -> arr
	| _ -> Array.append [| i64_type context |] arr

(* the part of the frame that has to be initialized is the one corresponding to the parameters, not the local variables and the functions *)

and init_fr fr param_arr idx n =
	match idx with
	| n -> ()
	| _ ->
	(
		let st_addr = build_in_bounds_gep fr [| const_int myint idx |] "" builder in
		(
			ignore(build_store param_arr.(idx) st_addr builder);
			init_fr fr param_arr (idx + 1) n
		)
	)

and declare_runtimes the_module =
	let ft = function_type (myvoid) [| myint |] in
	let f = declare_function "writeInteger" ft the_module in
	let ft = function_type (myvoid) [| mybyte |] in
	let f = declare_function "writeByte" ft the_module in
	let ft = function_type (myvoid) [| mybyte |] in
	let f = declare_function "writeChar" ft the_module in
	let ft = function_type (myvoid) [| mybyteref |] in
	let f = declare_function "writeString" ft the_module in
	let ft = function_type (myint) [| |] in
	let f = declare_function "readInteger" ft the_module in
	let ft = function_type (mybyte) [| |] in
	let f = declare_function "readByte" ft the_module in
	let ft = function_type (mybyte) [| |] in
	let f = declare_function "readhar" ft the_module in
	let ft = function_type (myvoid) [| myint; mybyteref |] in
	let f = declare_function "readString" ft the_module in
	let ft = function_type (myint) [| mybyte |] in
	let f = declare_function "extend" ft the_module in
	let ft = function_type (mybyte) [| myint |] in
	let f = declare_function "shrink" ft the_module in
	let ft = function_type (myint) [| mybyteref |] in
	let f = declare_function "strlen" ft the_module in
	let ft = function_type (myint) [| mybyteref; mybyteref |] in
	let f = declare_function "strcmp" ft the_module in
	let ft = function_type (myvoid) [| mybyteref; mybyteref |] in
	let f = declare_function "strcpy" ft the_module in
	let ft = function_type (myvoid) [| mybyteref; mybyteref |] in
	let f = declare_function "strcat" ft the_module in
	()

and ll_typ a =
	match a with
	| Int -> myint
	| Byte -> mybyte
	| IntArr -> myintref
	| ByteArr -> mybyteref

and ll_typ_ref a =
	match a with
	| Int -> myintref
	| Byte -> mybyteref
	| IntArr -> myintref
	| ByteArr -> mybyteref

and ret_ll_typ a =
	match a with
	| Data_type(Int) -> myint
	| Data_type(Byte) -> mybyte
	| Proc -> myvoid
	| _ -> raise (Failure "Invalid ret type!\n")

(* this function and the next operate on arrays*)

and extract_param_name a =
	match a with
	| Fpar_def_t(name, dtyp, _) -> name
	| Fpar_def_ref_t(name, dtyp, _) -> name
	| _ -> raise (Failure "Improper extract_param_name usage")

and extract_param_type a =
	match a with
	| Fpar_def_t(name, dtyp, _) ->
	(
		match dtyp with
		| Int -> myint
		| Byte -> mybyte
		| _ -> raise (Failure "Improper extract_param_type usage")
	)
        | Fpar_def_ref_t(name, dtyp, _) ->
	(
		match dtyp with
		| Int -> myintref
		| Byte -> mybyteref
		| IntArr -> myintref
		| ByteArr ->  mybyteref
	)
	| _ -> raise (Failure "Improper extract_param_type usage")

(* this function operates on lists *)

and extract_loc_var_def_type lst type_lst = 
	match lst with
	| [] -> List.rev type_lst
	| h::t ->
	(
		match h with
		| Var_def_t(_, typ, _) ->
		(
			match typ with
			| Int -> extract_loc_var_def_type t (myint::type_lst)
			| Byte -> extract_loc_var_def_type t (mybyte::type_lst)
			| _ -> raise (Failure "Improper extract_loc_var_def_type usage")
		)
		| Var_def_arr_t(_, typ, size, _) ->
		(
			match typ with
			| Int -> extract_loc_var_def_type t ((array_type myint size)::type_lst)
                        | Byte -> extract_loc_var_def_type t ((array_type mybyte size)::type_lst)
                        | _ -> raise (Failure "Improper extract_loc_var_def_type usage")
		)
		| Func_def_t(_) -> extract_loc_var_def_type t type_lst
		| _ -> raise (Failure "Improper extract_loc_var_def_type usage")
	)

and opt_list_to_array lst =
	match lst with
	| None -> Array.make 0 Empty_t
	| Some lista ->
	(
		let tmplista = List.map (Array.make 1) lista in
		Array.concat tmplist
	)

and deopt_l a =
	match a with
	| None -> []
	| Some a -> a

and deopt_lookup_function name =
	match lookup_function name the_module with
	| Some callee -> callee
	| None -> raise(Failure "Shouldn't happen. Already checked")
