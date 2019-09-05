
module MenhirBasics = struct
  
  exception Error
  
  type token = 
    | T_while
    | T_true
    | T_string of (
# 13 "Parser.mly"
      (int list)
# 13 "Parser.ml"
  )
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
    | T_id of (
# 12 "Parser.mly"
      (string)
# 41 "Parser.ml"
  )
    | T_false
    | T_eq
    | T_eof
    | T_else
    | T_div
    | T_const_char_ of (
# 11 "Parser.mly"
      (int)
# 51 "Parser.ml"
  )
    | T_const of (
# 10 "Parser.mly"
      (int)
# 56 "Parser.ml"
  )
    | T_com
    | T_col
    | T_byte
    | T_assign
    | T_and
  
end

include MenhirBasics

let _eRR =
  MenhirBasics.Error

type _menhir_env = {
  _menhir_lexer: Lexing.lexbuf -> token;
  _menhir_lexbuf: Lexing.lexbuf;
  _menhir_token: token;
  mutable _menhir_error: bool
}

and _menhir_state = 
  | MenhirState122
  | MenhirState115
  | MenhirState108
  | MenhirState105
  | MenhirState103
  | MenhirState101
  | MenhirState96
  | MenhirState94
  | MenhirState91
  | MenhirState89
  | MenhirState83
  | MenhirState75
  | MenhirState71
  | MenhirState68
  | MenhirState63
  | MenhirState61
  | MenhirState59
  | MenhirState57
  | MenhirState55
  | MenhirState49
  | MenhirState46
  | MenhirState45
  | MenhirState43
  | MenhirState37
  | MenhirState35
  | MenhirState34
  | MenhirState31
  | MenhirState23
  | MenhirState21
  | MenhirState19
  | MenhirState5
  | MenhirState4
  | MenhirState2
  | MenhirState0

# 1 "Parser.mly"
  
open Ast

let parse_error s =
	print_endline s;
	flush stdout


# 123 "Parser.ml"

let rec _menhir_goto_compare_op : _menhir_env -> 'ttv_tail -> 'tv_compare_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _v ->
    let _menhir_stack = (_menhir_stack, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv479 * _menhir_state * 'tv_expr) * 'tv_compare_op) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState83
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState83 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState83) : 'freshtv480)

and _menhir_run89 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | T_false ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | T_lparen ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | T_neg ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState89 _v
    | T_true ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState89
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState89

and _menhir_run91 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | T_false ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | T_lparen ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | T_neg ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState91 _v
    | T_true ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState91
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState91

and _menhir_run77 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv477) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_compare_op = 
# 107 "Parser.mly"
          (Ast.Neq )
# 221 "Parser.ml"
     in
    _menhir_goto_compare_op _menhir_env _menhir_stack _v) : 'freshtv478)

and _menhir_run78 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv475) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_compare_op = 
# 111 "Parser.mly"
             (Ast.Morequ )
# 234 "Parser.ml"
     in
    _menhir_goto_compare_op _menhir_env _menhir_stack _v) : 'freshtv476)

and _menhir_run79 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv473) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_compare_op = 
# 109 "Parser.mly"
           (Ast.More )
# 247 "Parser.ml"
     in
    _menhir_goto_compare_op _menhir_env _menhir_stack _v) : 'freshtv474)

and _menhir_run80 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv471) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_compare_op = 
# 110 "Parser.mly"
              (Ast.Lessequ )
# 260 "Parser.ml"
     in
    _menhir_goto_compare_op _menhir_env _menhir_stack _v) : 'freshtv472)

and _menhir_run81 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv469) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_compare_op = 
# 108 "Parser.mly"
           (Ast.Less )
# 273 "Parser.ml"
     in
    _menhir_goto_compare_op _menhir_env _menhir_stack _v) : 'freshtv470)

and _menhir_run82 : _menhir_env -> 'ttv_tail -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv467) = Obj.magic _menhir_stack in
    ((let _1 = () in
    let _v : 'tv_compare_op = 
# 106 "Parser.mly"
                  (Ast.Eq )
# 286 "Parser.ml"
     in
    _menhir_goto_compare_op _menhir_env _menhir_stack _v) : 'freshtv468)

and _menhir_goto_expr_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv465 * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_com ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv459 * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_const _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | T_const_char_ _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | T_id _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | T_lparen ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | T_minus ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | T_plus ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState68
        | T_string _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState68 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState68) : 'freshtv460)
    | T_rparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv461 * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_expr_list)) = _menhir_stack in
        let _v : 'tv_option_expr_list_ = 
# 116 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( Some x )
# 329 "Parser.ml"
         in
        _menhir_goto_option_expr_list_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv462)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv463 * _menhir_state * 'tv_expr_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv464)) : 'freshtv466)

and _menhir_run54 : _menhir_env -> ('ttv_tail * _menhir_state) * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv457 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
    ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_expr)) = _menhir_stack in
    let _3 = () in
    let _1 = () in
    let _v : 'tv_expr = 
# 93 "Parser.mly"
                           ( _2 )
# 351 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv458)

and _menhir_run55 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState55
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState55 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState55

and _menhir_run57 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState57
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState57 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState57

and _menhir_run59 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState59
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState59 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState59

and _menhir_run63 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState63
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState63 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState63

and _menhir_run61 : _menhir_env -> 'ttv_tail * _menhir_state * 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState61
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState61 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState61

and _menhir_goto_cond : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_cond -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv425 * _menhir_state * 'tv_unary_logic_op) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv423 * _menhir_state * 'tv_unary_logic_op) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_unary_logic_op)), _, (_2 : 'tv_cond)) = _menhir_stack in
        let _v : 'tv_cond = 
# 119 "Parser.mly"
                                        (Ast.Unop(_1,_2) )
# 488 "Parser.ml"
         in
        _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv424)) : 'freshtv426)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv433 * _menhir_state) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_and ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | T_or ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv429 * _menhir_state) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv427 * _menhir_state) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_cond)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_cond = 
# 117 "Parser.mly"
                           ( _2 )
# 513 "Parser.ml"
             in
            _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv428)) : 'freshtv430)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv431 * _menhir_state) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv432)) : 'freshtv434)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv439 * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_and ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | T_or | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv435 * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_cond)), _, (_3 : 'tv_cond)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_cond = 
# 121 "Parser.mly"
                   (Ast.Binop(_1,Ast.Or,_3) )
# 539 "Parser.ml"
             in
            _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv436)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv437 * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv438)) : 'freshtv440)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv443 * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv441 * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_cond)), _, (_3 : 'tv_cond)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_cond = 
# 120 "Parser.mly"
                    (Ast.Binop(_1,Ast.And,_3) )
# 559 "Parser.ml"
         in
        _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv442)) : 'freshtv444)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv449 * _menhir_state)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_and ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | T_or ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv445 * _menhir_state)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_id _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | T_if ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | T_lbrace ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | T_return ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | T_semicol ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | T_string _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState94 _v
            | T_while ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState94
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState94) : 'freshtv446)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv447 * _menhir_state)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv448)) : 'freshtv450)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv455 * _menhir_state)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_and ->
            _menhir_run91 _menhir_env (Obj.magic _menhir_stack)
        | T_or ->
            _menhir_run89 _menhir_env (Obj.magic _menhir_stack)
        | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv451 * _menhir_state)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_id _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
            | T_if ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | T_lbrace ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | T_return ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | T_semicol ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | T_string _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState103 _v
            | T_while ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState103
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState103) : 'freshtv452)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv453 * _menhir_state)) * _menhir_state * 'tv_cond) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv454)) : 'freshtv456)
    | _ ->
        _menhir_fail ()

and _menhir_goto_unary_op : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_unary_op -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv421 * _menhir_state * 'tv_unary_op) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState49
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState49 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState49) : 'freshtv422)

and _menhir_goto_expr : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_expr -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv339 * _menhir_state * 'tv_unary_op) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv337 * _menhir_state * 'tv_unary_op) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_unary_op)), _, (_2 : 'tv_expr)) = _menhir_stack in
        let _v : 'tv_expr = 
# 95 "Parser.mly"
                                   (Ast.Unop(_1,_2) )
# 687 "Parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv338)) : 'freshtv340)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv343 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_rparen ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv341 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv342)) : 'freshtv344)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv349 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_and | T_com | T_eq | T_less | T_lessequ | T_more | T_morequ | T_neq | T_or | T_plus | T_rbrack | T_rparen | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv345 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_expr)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 96 "Parser.mly"
                     (Ast.Binop(_1,Ast.Plus,_3) )
# 737 "Parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv346)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv347 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv348)) : 'freshtv350)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv355 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_and | T_com | T_eq | T_less | T_lessequ | T_minus | T_more | T_morequ | T_mul | T_neq | T_or | T_plus | T_rbrack | T_rparen | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv351 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_expr)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 98 "Parser.mly"
                    (Ast.Binop(_1,Ast.Mul,_3) )
# 765 "Parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv352)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv353 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv354)) : 'freshtv356)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv359 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv357 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_expr)), _, (_3 : 'tv_expr)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_expr = 
# 100 "Parser.mly"
                    (Ast.Binop(_1,Ast.Mod,_3) )
# 785 "Parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv358)) : 'freshtv360)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv365 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_and | T_com | T_div | T_eq | T_less | T_lessequ | T_minus | T_more | T_morequ | T_mul | T_neq | T_or | T_plus | T_rbrack | T_rparen | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv361 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_expr)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 99 "Parser.mly"
                    (Ast.Binop(_1,Ast.Div,_3) )
# 804 "Parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv362)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv363 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv364)) : 'freshtv366)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv371 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_and | T_com | T_eq | T_less | T_lessequ | T_minus | T_more | T_morequ | T_neq | T_or | T_plus | T_rbrack | T_rparen | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv367 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_expr)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr = 
# 97 "Parser.mly"
                      (Ast.Binop(_1,Ast.Minus,_3) )
# 834 "Parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv368)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv369 * _menhir_state * 'tv_expr)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv370)) : 'freshtv372)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv377 * _menhir_state * 'tv_expr_list)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_com | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv373 * _menhir_state * 'tv_expr_list)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_expr_list)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _2 = () in
            let _v : 'tv_expr_list = 
# 85 "Parser.mly"
                         (_1@[_3] )
# 868 "Parser.ml"
             in
            _menhir_goto_expr_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv374)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv375 * _menhir_state * 'tv_expr_list)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv376)) : 'freshtv378)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv383 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_com | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv379 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_expr)) = _menhir_stack in
            let _v : 'tv_expr_list = 
# 84 "Parser.mly"
                 (_1::[] )
# 901 "Parser.ml"
             in
            _menhir_goto_expr_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv380)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv381 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv382)) : 'freshtv384)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv391 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 916 "Parser.ml"
        ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_rbrack ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv387 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 936 "Parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv385 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 943 "Parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 948 "Parser.ml"
            ))), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_l_value = 
# 103 "Parser.mly"
                                (Ast.Lvalue(Ast.Arr(_1,_3)) )
# 955 "Parser.ml"
             in
            _menhir_goto_l_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv386)) : 'freshtv388)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv389 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 965 "Parser.ml"
            ))) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv390)) : 'freshtv392)
    | MenhirState101 | MenhirState37 | MenhirState91 | MenhirState89 | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv395 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_eq ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | T_less ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | T_lessequ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_more ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | T_morequ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_neq ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv393 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv394)) : 'freshtv396)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv401 * _menhir_state * 'tv_expr) * 'tv_compare_op) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_and | T_or | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv397 * _menhir_state * 'tv_expr) * 'tv_compare_op) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s, (_1 : 'tv_expr)), (_2 : 'tv_compare_op)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _v : 'tv_cond = 
# 118 "Parser.mly"
                         (Ast.Binop(_1,_2,_3) )
# 1027 "Parser.ml"
             in
            _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv398)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv399 * _menhir_state * 'tv_expr) * 'tv_compare_op) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv400)) : 'freshtv402)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv405 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_eq ->
            _menhir_run82 _menhir_env (Obj.magic _menhir_stack)
        | T_less ->
            _menhir_run81 _menhir_env (Obj.magic _menhir_stack)
        | T_lessequ ->
            _menhir_run80 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_more ->
            _menhir_run79 _menhir_env (Obj.magic _menhir_stack)
        | T_morequ ->
            _menhir_run78 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_neq ->
            _menhir_run77 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_rparen ->
            _menhir_run54 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv403 * _menhir_state) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv404)) : 'freshtv406)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv411 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv407 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (x : 'tv_expr)) = _menhir_stack in
            let _v : 'tv_option_expr_ = 
# 116 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( Some x )
# 1097 "Parser.ml"
             in
            _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv408)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv409 * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv410)) : 'freshtv412)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv419 * _menhir_state * 'tv_l_value)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_div ->
            _menhir_run61 _menhir_env (Obj.magic _menhir_stack)
        | T_minus ->
            _menhir_run63 _menhir_env (Obj.magic _menhir_stack)
        | T_mod ->
            _menhir_run59 _menhir_env (Obj.magic _menhir_stack)
        | T_mul ->
            _menhir_run57 _menhir_env (Obj.magic _menhir_stack)
        | T_plus ->
            _menhir_run55 _menhir_env (Obj.magic _menhir_stack)
        | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv415 * _menhir_state * 'tv_l_value)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv413 * _menhir_state * 'tv_l_value)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : 'tv_l_value)), _, (_3 : 'tv_expr)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_stmt = 
# 72 "Parser.mly"
                                    (Ast.Assign(_1,_3))
# 1135 "Parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv414)) : 'freshtv416)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv417 * _menhir_state * 'tv_l_value)) * _menhir_state * 'tv_expr) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv418)) : 'freshtv420)
    | _ ->
        _menhir_fail ()

and _menhir_goto_list_stmt_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_stmt_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv297 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_list_stmt_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv295 * _menhir_state * 'tv_stmt) * _menhir_state * 'tv_list_stmt_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_stmt)), _, (xs : 'tv_list_stmt_)) = _menhir_stack in
        let _v : 'tv_list_stmt_ = 
# 201 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( x :: xs )
# 1161 "Parser.ml"
         in
        _menhir_goto_list_stmt_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv296)) : 'freshtv298)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv335 * _menhir_state) * _menhir_state * 'tv_list_stmt_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_rbrace ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv331 * _menhir_state) * _menhir_state * 'tv_list_stmt_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv329 * _menhir_state) * _menhir_state * 'tv_list_stmt_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_list_stmt_)) = _menhir_stack in
            let _3 = () in
            let _1 = () in
            let _v : 'tv_compound_stmt = 
# 80 "Parser.mly"
                                        ( _2 )
# 1182 "Parser.ml"
             in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv327) = _menhir_stack in
            let (_menhir_s : _menhir_state) = _menhir_s in
            let (_v : 'tv_compound_stmt) = _v in
            ((match _menhir_s with
            | MenhirState35 | MenhirState115 | MenhirState94 | MenhirState103 | MenhirState105 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv301) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_compound_stmt) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv299) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let ((_1 : 'tv_compound_stmt) : 'tv_compound_stmt) = _v in
                ((let _v : 'tv_stmt = 
# 73 "Parser.mly"
                  (Ast.Compound(_1) )
# 1201 "Parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv300)) : 'freshtv302)
            | MenhirState34 ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv325 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 1209 "Parser.ml"
                ))) * _menhir_state * 'tv_option_fpar_list_))) * _menhir_state * 'tv_r_type_) * _menhir_state * 'tv_list_local_def_) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_compound_stmt) = _v in
                ((let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : (((((('freshtv323 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 1217 "Parser.ml"
                ))) * _menhir_state * 'tv_option_fpar_list_))) * _menhir_state * 'tv_r_type_) * _menhir_state * 'tv_list_local_def_) = Obj.magic _menhir_stack in
                let (_ : _menhir_state) = _menhir_s in
                let ((_8 : 'tv_compound_stmt) : 'tv_compound_stmt) = _v in
                ((let ((((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 1224 "Parser.ml"
                ))), _, (_3 : 'tv_option_fpar_list_)), _, (_6 : 'tv_r_type_)), _, (_7 : 'tv_list_local_def_)) = _menhir_stack in
                let _5 = () in
                let _4 = () in
                let _2 = () in
                let _v : 'tv_func_def = 
# 46 "Parser.mly"
  ( Ast.Func_def(_1,_3,_6,_7,Ast.Compound(_8)) )
# 1232 "Parser.ml"
                 in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv321) = _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                let (_v : 'tv_func_def) = _v in
                ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
                match _menhir_s with
                | MenhirState21 | MenhirState31 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv305 * _menhir_state * 'tv_func_def) = Obj.magic _menhir_stack in
                    ((let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv303 * _menhir_state * 'tv_func_def) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s, (_1 : 'tv_func_def)) = _menhir_stack in
                    let _v : 'tv_local_def = 
# 65 "Parser.mly"
                     ( _1 )
# 1249 "Parser.ml"
                     in
                    _menhir_goto_local_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv304)) : 'freshtv306)
                | MenhirState0 ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv319 * _menhir_state * 'tv_func_def) = Obj.magic _menhir_stack in
                    ((assert (not _menhir_env._menhir_error);
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | T_eof ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv315 * _menhir_state * 'tv_func_def) = Obj.magic _menhir_stack in
                        ((let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv313 * _menhir_state * 'tv_func_def) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_func_def)) = _menhir_stack in
                        let _2 = () in
                        let _v : (
# 39 "Parser.mly"
      (Ast.ast)
# 1268 "Parser.ml"
                        ) = 
# 43 "Parser.mly"
                          (Ast.Program(_1))
# 1272 "Parser.ml"
                         in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv311) = _menhir_stack in
                        let (_menhir_s : _menhir_state) = _menhir_s in
                        let (_v : (
# 39 "Parser.mly"
      (Ast.ast)
# 1280 "Parser.ml"
                        )) = _v in
                        ((let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv309) = Obj.magic _menhir_stack in
                        let (_menhir_s : _menhir_state) = _menhir_s in
                        let (_v : (
# 39 "Parser.mly"
      (Ast.ast)
# 1288 "Parser.ml"
                        )) = _v in
                        ((let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv307) = Obj.magic _menhir_stack in
                        let (_menhir_s : _menhir_state) = _menhir_s in
                        let ((_1 : (
# 39 "Parser.mly"
      (Ast.ast)
# 1296 "Parser.ml"
                        )) : (
# 39 "Parser.mly"
      (Ast.ast)
# 1300 "Parser.ml"
                        )) = _v in
                        (Obj.magic _1 : 'freshtv308)) : 'freshtv310)) : 'freshtv312)) : 'freshtv314)) : 'freshtv316)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : 'freshtv317 * _menhir_state * 'tv_func_def) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv318)) : 'freshtv320)
                | _ ->
                    _menhir_fail ()) : 'freshtv322)) : 'freshtv324)) : 'freshtv326)
            | _ ->
                _menhir_fail ()) : 'freshtv328)) : 'freshtv330)) : 'freshtv332)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv333 * _menhir_state) * _menhir_state * 'tv_list_stmt_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv334)) : 'freshtv336)
    | _ ->
        _menhir_fail ()

and _menhir_goto_stmt : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_stmt -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv283 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_else ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv277 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_id _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | T_if ->
                _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | T_lbrace ->
                _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | T_return ->
                _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | T_semicol ->
                _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | T_string _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState105 _v
            | T_while ->
                _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState105
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState105) : 'freshtv278)
        | T_id _ | T_if | T_lbrace | T_rbrace | T_return | T_semicol | T_string _ | T_while ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv279 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
            ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_cond)), _, (_5 : 'tv_stmt)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _1 = () in
            let _v : 'tv_stmt = 
# 78 "Parser.mly"
                                                      (Ast.If(_3,_5))
# 1368 "Parser.ml"
             in
            _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv280)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (((('freshtv281 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv282)) : 'freshtv284)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv287 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv285 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let ((((_menhir_stack, _menhir_s), _, (_3 : 'tv_cond)), _, (_5 : 'tv_stmt)), _, (_7 : 'tv_stmt)) = _menhir_stack in
        let _6 = () in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_stmt = 
# 77 "Parser.mly"
                                                 (Ast.If_Else(_3,_5,_7))
# 1391 "Parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv286)) : 'freshtv288)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv291 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv289 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (((_menhir_stack, _menhir_s), _, (_3 : 'tv_cond)), _, (_5 : 'tv_stmt)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _1 = () in
        let _v : 'tv_stmt = 
# 75 "Parser.mly"
                                        (Ast.While(_3,_5))
# 1406 "Parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv290)) : 'freshtv292)
    | MenhirState115 | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv293 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_id _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | T_if ->
            _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | T_lbrace ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | T_return ->
            _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | T_semicol ->
            _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | T_string _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState115 _v
        | T_while ->
            _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | T_rbrace ->
            _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState115
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState115) : 'freshtv294)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_expr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_expr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ('freshtv275 * _menhir_state) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_semicol ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv271 * _menhir_state) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv269 * _menhir_state) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s), _, (_2 : 'tv_option_expr_)) = _menhir_stack in
        let _3 = () in
        let _1 = () in
        let _v : 'tv_stmt = 
# 76 "Parser.mly"
                             (Ast.Return(_2))
# 1458 "Parser.ml"
         in
        _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv270)) : 'freshtv272)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv273 * _menhir_state) * _menhir_state * 'tv_option_expr_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv274)) : 'freshtv276)

and _menhir_run38 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv267) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_cond = 
# 115 "Parser.mly"
                (Ast.Const(Ast.True) )
# 1479 "Parser.ml"
     in
    _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv268)

and _menhir_run41 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv265) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_unary_logic_op = 
# 113 "Parser.mly"
                       ( Ast.Neg )
# 1493 "Parser.ml"
     in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv263) = _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_unary_logic_op) = _v in
    ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv261 * _menhir_state * 'tv_unary_logic_op) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | T_false ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | T_lparen ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | T_neg ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState75 _v
    | T_true ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState75
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState75) : 'freshtv262)) : 'freshtv264)) : 'freshtv266)

and _menhir_run43 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | T_false ->
        _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | T_lparen ->
        _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | T_neg ->
        _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState43 _v
    | T_true ->
        _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState43
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState43

and _menhir_run74 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv259) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_cond = 
# 116 "Parser.mly"
            (Ast.Const(Ast.False) )
# 1571 "Parser.ml"
     in
    _menhir_goto_cond _menhir_env _menhir_stack _menhir_s _v) : 'freshtv260)

and _menhir_goto_l_value : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_l_value -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState108 | MenhirState101 | MenhirState96 | MenhirState37 | MenhirState91 | MenhirState89 | MenhirState43 | MenhirState83 | MenhirState75 | MenhirState71 | MenhirState68 | MenhirState45 | MenhirState63 | MenhirState61 | MenhirState59 | MenhirState57 | MenhirState55 | MenhirState46 | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv251 * _menhir_state * 'tv_l_value) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv249 * _menhir_state * 'tv_l_value) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_l_value)) = _menhir_stack in
        let _v : 'tv_expr = 
# 92 "Parser.mly"
            ( _1 )
# 1588 "Parser.ml"
         in
        _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv250)) : 'freshtv252)
    | MenhirState35 | MenhirState115 | MenhirState94 | MenhirState103 | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv257 * _menhir_state * 'tv_l_value) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_assign ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv253 * _menhir_state * 'tv_l_value) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_const _v ->
                _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
            | T_const_char_ _v ->
                _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
            | T_id _v ->
                _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
            | T_lparen ->
                _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState108
            | T_minus ->
                _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState108
            | T_plus ->
                _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState108
            | T_string _v ->
                _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState108 _v
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState108) : 'freshtv254)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv255 * _menhir_state * 'tv_l_value) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv256)) : 'freshtv258)
    | _ ->
        _menhir_fail ()

and _menhir_goto_option_expr_list_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_expr_list_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv247 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 1638 "Parser.ml"
    ))) * _menhir_state * 'tv_option_expr_list_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_rparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv243 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 1648 "Parser.ml"
        ))) * _menhir_state * 'tv_option_expr_list_) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv241 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 1655 "Parser.ml"
        ))) * _menhir_state * 'tv_option_expr_list_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 1660 "Parser.ml"
        ))), _, (_3 : 'tv_option_expr_list_)) = _menhir_stack in
        let _4 = () in
        let _2 = () in
        let _v : 'tv_func_call = 
# 82 "Parser.mly"
                                              (Ast.Func_call(_1,_3))
# 1667 "Parser.ml"
         in
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv239) = _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_func_call) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        match _menhir_s with
        | MenhirState108 | MenhirState101 | MenhirState96 | MenhirState37 | MenhirState91 | MenhirState89 | MenhirState43 | MenhirState83 | MenhirState75 | MenhirState71 | MenhirState68 | MenhirState45 | MenhirState63 | MenhirState61 | MenhirState59 | MenhirState57 | MenhirState55 | MenhirState46 | MenhirState49 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv229 * _menhir_state * 'tv_func_call) = Obj.magic _menhir_stack in
            ((let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv227 * _menhir_state * 'tv_func_call) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, (_1 : 'tv_func_call)) = _menhir_stack in
            let _v : 'tv_expr = 
# 94 "Parser.mly"
              ( _1 )
# 1684 "Parser.ml"
             in
            _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv228)) : 'freshtv230)
        | MenhirState35 | MenhirState115 | MenhirState94 | MenhirState103 | MenhirState105 ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv237 * _menhir_state * 'tv_func_call) = Obj.magic _menhir_stack in
            ((assert (not _menhir_env._menhir_error);
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_semicol ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv233 * _menhir_state * 'tv_func_call) = Obj.magic _menhir_stack in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv231 * _menhir_state * 'tv_func_call) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, (_1 : 'tv_func_call)) = _menhir_stack in
                let _2 = () in
                let _v : 'tv_stmt = 
# 74 "Parser.mly"
                        (_1 )
# 1704 "Parser.ml"
                 in
                _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv232)) : 'freshtv234)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv235 * _menhir_state * 'tv_func_call) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv236)) : 'freshtv238)
        | _ ->
            _menhir_fail ()) : 'freshtv240)) : 'freshtv242)) : 'freshtv244)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv245 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 1723 "Parser.ml"
        ))) * _menhir_state * 'tv_option_expr_list_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv246)) : 'freshtv248)

and _menhir_run40 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv225) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_unary_op = 
# 87 "Parser.mly"
                  (Ast.Plus )
# 1738 "Parser.ml"
     in
    _menhir_goto_unary_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv226)

and _menhir_run42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv223) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_unary_op = 
# 88 "Parser.mly"
            (Ast.Minus )
# 1752 "Parser.ml"
     in
    _menhir_goto_unary_op _menhir_env _menhir_stack _menhir_s _v) : 'freshtv224)

and _menhir_run46 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState46
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState46 _v
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState46

and _menhir_run47 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 11 "Parser.mly"
      (int)
# 1784 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv221) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 11 "Parser.mly"
      (int)
# 1794 "Parser.ml"
    )) : (
# 11 "Parser.mly"
      (int)
# 1798 "Parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 91 "Parser.mly"
                  (Ast.Const(Ast.Char(_1)))
# 1803 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv222)

and _menhir_run48 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 10 "Parser.mly"
      (int)
# 1810 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv219) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 10 "Parser.mly"
      (int)
# 1820 "Parser.ml"
    )) : (
# 10 "Parser.mly"
      (int)
# 1824 "Parser.ml"
    )) = _v in
    ((let _v : 'tv_expr = 
# 90 "Parser.mly"
                (Ast.Const(Ast.Int(_1)) )
# 1829 "Parser.ml"
     in
    _menhir_goto_expr _menhir_env _menhir_stack _menhir_s _v) : 'freshtv220)

and _menhir_reduce44 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_stmt_ = 
# 199 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( [] )
# 1838 "Parser.ml"
     in
    _menhir_goto_list_stmt_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run36 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv215 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_const _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | T_const_char_ _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | T_false ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | T_id _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | T_lparen ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | T_minus ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | T_neg ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | T_plus ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | T_string _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState37 _v
        | T_true ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState37
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState37) : 'freshtv216)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv217 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv218)

and _menhir_run39 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 13 "Parser.mly"
      (int list)
# 1889 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv213) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : (
# 13 "Parser.mly"
      (int list)
# 1899 "Parser.ml"
    )) : (
# 13 "Parser.mly"
      (int list)
# 1903 "Parser.ml"
    )) = _v in
    ((let _v : 'tv_l_value = 
# 104 "Parser.mly"
             (Ast.Lvalue(Ast.Literal(_1)) )
# 1908 "Parser.ml"
     in
    _menhir_goto_l_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv214)

and _menhir_run95 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_env = _menhir_discard _menhir_env in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv211) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    ((let _1 = () in
    let _v : 'tv_stmt = 
# 71 "Parser.mly"
                  (Ast.Empty )
# 1922 "Parser.ml"
     in
    _menhir_goto_stmt _menhir_env _menhir_stack _menhir_s _v) : 'freshtv212)

and _menhir_run96 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_const _v ->
        _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
    | T_const_char_ _v ->
        _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
    | T_lparen ->
        _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | T_minus ->
        _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | T_plus ->
        _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState96
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState96 _v
    | T_semicol ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv209) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState96 in
        ((let _v : 'tv_option_expr_ = 
# 114 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( None )
# 1953 "Parser.ml"
         in
        _menhir_goto_option_expr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv210)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState96

and _menhir_run100 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv205 * _menhir_state) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_const _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | T_const_char_ _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | T_false ->
            _menhir_run74 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | T_id _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | T_lparen ->
            _menhir_run43 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | T_minus ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | T_neg ->
            _menhir_run41 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | T_plus ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | T_string _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState101 _v
        | T_true ->
            _menhir_run38 _menhir_env (Obj.magic _menhir_stack) MenhirState101
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState101) : 'freshtv206)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv207 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv208)

and _menhir_run44 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "Parser.mly"
      (string)
# 2008 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_lbrack ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv195 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2020 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_const _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | T_const_char_ _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | T_id _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | T_lparen ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | T_minus ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | T_plus ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState71
        | T_string _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState71 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState71) : 'freshtv196)
    | T_lparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv199 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2048 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_const _v ->
            _menhir_run48 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | T_const_char_ _v ->
            _menhir_run47 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | T_id _v ->
            _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | T_lparen ->
            _menhir_run46 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | T_minus ->
            _menhir_run42 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | T_plus ->
            _menhir_run40 _menhir_env (Obj.magic _menhir_stack) MenhirState45
        | T_string _v ->
            _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState45 _v
        | T_rparen ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv197) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState45 in
            ((let _v : 'tv_option_expr_list_ = 
# 114 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( None )
# 2074 "Parser.ml"
             in
            _menhir_goto_option_expr_list_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv198)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState45) : 'freshtv200)
    | T_and | T_assign | T_com | T_div | T_eq | T_less | T_lessequ | T_minus | T_mod | T_more | T_morequ | T_mul | T_neq | T_or | T_plus | T_rbrack | T_rparen | T_semicol ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv201 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2086 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 2091 "Parser.ml"
        ))) = _menhir_stack in
        let _v : 'tv_l_value = 
# 102 "Parser.mly"
                (Ast.Lvalue(Ast.Variable(_1)) )
# 2096 "Parser.ml"
         in
        _menhir_goto_l_value _menhir_env _menhir_stack _menhir_s _v) : 'freshtv202)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv203 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2106 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv204)

and _menhir_run35 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_id _v ->
        _menhir_run44 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | T_if ->
        _menhir_run100 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | T_lbrace ->
        _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | T_return ->
        _menhir_run96 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | T_semicol ->
        _menhir_run95 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | T_string _v ->
        _menhir_run39 _menhir_env (Obj.magic _menhir_stack) MenhirState35 _v
    | T_while ->
        _menhir_run36 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | T_rbrace ->
        _menhir_reduce44 _menhir_env (Obj.magic _menhir_stack) MenhirState35
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState35

and _menhir_goto_local_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_local_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv193 * _menhir_state * 'tv_local_def) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_id _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState31 _v
    | T_lbrace ->
        _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) MenhirState31
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState31) : 'freshtv194)

and _menhir_goto_list_local_def_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_list_local_def_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv189 * _menhir_state * 'tv_local_def) * _menhir_state * 'tv_list_local_def_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv187 * _menhir_state * 'tv_local_def) * _menhir_state * 'tv_list_local_def_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (x : 'tv_local_def)), _, (xs : 'tv_list_local_def_)) = _menhir_stack in
        let _v : 'tv_list_local_def_ = 
# 201 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( x :: xs )
# 2168 "Parser.ml"
         in
        _menhir_goto_list_local_def_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv188)) : 'freshtv190)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv191 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2176 "Parser.ml"
        ))) * _menhir_state * 'tv_option_fpar_list_))) * _menhir_state * 'tv_r_type_) * _menhir_state * 'tv_list_local_def_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_lbrace ->
            _menhir_run35 _menhir_env (Obj.magic _menhir_stack) MenhirState34
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState34) : 'freshtv192)
    | _ ->
        _menhir_fail ()

and _menhir_goto_var_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_var_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv185) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_var_def) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv183) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let ((_1 : 'tv_var_def) : 'tv_var_def) = _v in
    ((let _v : 'tv_local_def = 
# 66 "Parser.mly"
            ( _1 )
# 2203 "Parser.ml"
     in
    _menhir_goto_local_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv184)) : 'freshtv186)

and _menhir_fail : unit -> 'a =
  fun () ->
    Printf.fprintf Pervasives.stderr "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

and _menhir_goto_fpar_list : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_fpar_list -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv181 * _menhir_state * 'tv_fpar_list) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_com ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv175 * _menhir_state * 'tv_fpar_list) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_id _v ->
            _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState122 _v
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState122) : 'freshtv176)
    | T_rparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv177 * _menhir_state * 'tv_fpar_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (x : 'tv_fpar_list)) = _menhir_stack in
        let _v : 'tv_option_fpar_list_ = 
# 116 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( Some x )
# 2239 "Parser.ml"
         in
        _menhir_goto_option_fpar_list_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv178)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv179 * _menhir_state * 'tv_fpar_list) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv180)) : 'freshtv182)

and _menhir_reduce42 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _v : 'tv_list_local_def_ = 
# 199 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( [] )
# 2255 "Parser.ml"
     in
    _menhir_goto_list_local_def_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_run22 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "Parser.mly"
      (string)
# 2262 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_col ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv171 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2274 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_byte ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | T_int ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState23
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState23) : 'freshtv172)
    | T_lparen ->
        _menhir_run2 _menhir_env (Obj.magic _menhir_stack)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv173 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2296 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv174)

and _menhir_goto_data_type_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data_type_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    match _menhir_s with
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv137 * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv135 * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_data_type_)) = _menhir_stack in
        let _v : 'tv_data_type_arr_ = 
# 57 "Parser.mly"
                            ( _1 )
# 2314 "Parser.ml"
         in
        _menhir_goto_data_type_arr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv136)) : 'freshtv138)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv141 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2322 "Parser.ml"
        ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv139 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2328 "Parser.ml"
        ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 2333 "Parser.ml"
        ))), _, (_3 : 'tv_data_type_)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_fpar_def = 
# 51 "Parser.mly"
                                  ( Ast.Fpar_def(_1,_3))
# 2339 "Parser.ml"
         in
        _menhir_goto_fpar_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv140)) : 'freshtv142)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv165 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2347 "Parser.ml"
        ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((assert (not _menhir_env._menhir_error);
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_lbrack ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv157 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2357 "Parser.ml"
            ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_const _v ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv153 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2367 "Parser.ml"
                ))) * _menhir_state * 'tv_data_type_)) = Obj.magic _menhir_stack in
                let (_v : (
# 10 "Parser.mly"
      (int)
# 2372 "Parser.ml"
                )) = _v in
                ((let _menhir_stack = (_menhir_stack, _v) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | T_rbrack ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((('freshtv149 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2383 "Parser.ml"
                    ))) * _menhir_state * 'tv_data_type_)) * (
# 10 "Parser.mly"
      (int)
# 2387 "Parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | T_semicol ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((((('freshtv145 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2397 "Parser.ml"
                        ))) * _menhir_state * 'tv_data_type_)) * (
# 10 "Parser.mly"
      (int)
# 2401 "Parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((((('freshtv143 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2408 "Parser.ml"
                        ))) * _menhir_state * 'tv_data_type_)) * (
# 10 "Parser.mly"
      (int)
# 2412 "Parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let (((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 2417 "Parser.ml"
                        ))), _, (_3 : 'tv_data_type_)), (_5 : (
# 10 "Parser.mly"
      (int)
# 2421 "Parser.ml"
                        ))) = _menhir_stack in
                        let _7 = () in
                        let _6 = () in
                        let _4 = () in
                        let _2 = () in
                        let _v : 'tv_var_def = 
# 69 "Parser.mly"
                                                              (Ast.Var_def_arr(_1,_3,_5) )
# 2430 "Parser.ml"
                         in
                        _menhir_goto_var_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv144)) : 'freshtv146)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ((((('freshtv147 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2440 "Parser.ml"
                        ))) * _menhir_state * 'tv_data_type_)) * (
# 10 "Parser.mly"
      (int)
# 2444 "Parser.ml"
                        ))) = Obj.magic _menhir_stack in
                        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv148)) : 'freshtv150)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : (((('freshtv151 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2455 "Parser.ml"
                    ))) * _menhir_state * 'tv_data_type_)) * (
# 10 "Parser.mly"
      (int)
# 2459 "Parser.ml"
                    )) = Obj.magic _menhir_stack in
                    ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv152)) : 'freshtv154)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : ((('freshtv155 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2470 "Parser.ml"
                ))) * _menhir_state * 'tv_data_type_)) = Obj.magic _menhir_stack in
                ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv156)) : 'freshtv158)
        | T_semicol ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv161 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2479 "Parser.ml"
            ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv159 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2486 "Parser.ml"
            ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
            ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 2491 "Parser.ml"
            ))), _, (_3 : 'tv_data_type_)) = _menhir_stack in
            let _4 = () in
            let _2 = () in
            let _v : 'tv_var_def = 
# 68 "Parser.mly"
                                           ( Ast.Var_def(_1,_3) )
# 2498 "Parser.ml"
             in
            _menhir_goto_var_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv160)) : 'freshtv162)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : (('freshtv163 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2508 "Parser.ml"
            ))) * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv164)) : 'freshtv166)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv169 * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv167 * _menhir_state * 'tv_data_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_data_type_)) = _menhir_stack in
        let _v : 'tv_r_type_ = 
# 62 "Parser.mly"
                      ( Ast.Data_type(_1) )
# 2521 "Parser.ml"
         in
        _menhir_goto_r_type_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv168)) : 'freshtv170)
    | _ ->
        _menhir_fail ()

and _menhir_goto_fpar_def : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_fpar_def -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    match _menhir_s with
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv129 * _menhir_state * 'tv_fpar_list)) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_fpar_def) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv127 * _menhir_state * 'tv_fpar_list)) = Obj.magic _menhir_stack in
        let (_ : _menhir_state) = _menhir_s in
        let ((_3 : 'tv_fpar_def) : 'tv_fpar_def) = _v in
        ((let (_menhir_stack, _menhir_s, (_1 : 'tv_fpar_list)) = _menhir_stack in
        let _2 = () in
        let _v : 'tv_fpar_list = 
# 49 "Parser.mly"
                             (_1@[_3] )
# 2544 "Parser.ml"
         in
        _menhir_goto_fpar_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv128)) : 'freshtv130)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv133) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let (_v : 'tv_fpar_def) = _v in
        ((let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv131) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = _menhir_s in
        let ((_1 : 'tv_fpar_def) : 'tv_fpar_def) = _v in
        ((let _v : 'tv_fpar_list = 
# 48 "Parser.mly"
                     (_1::[] )
# 2559 "Parser.ml"
         in
        _menhir_goto_fpar_list _menhir_env _menhir_stack _menhir_s _v) : 'freshtv132)) : 'freshtv134)
    | _ ->
        _menhir_fail ()

and _menhir_goto_r_type_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_r_type_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : ((((('freshtv125 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2572 "Parser.ml"
    ))) * _menhir_state * 'tv_option_fpar_list_))) * _menhir_state * 'tv_r_type_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_id _v ->
        _menhir_run22 _menhir_env (Obj.magic _menhir_stack) MenhirState21 _v
    | T_lbrace ->
        _menhir_reduce42 _menhir_env (Obj.magic _menhir_stack) MenhirState21
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState21) : 'freshtv126)

and _menhir_reduce15 : _menhir_env -> 'ttv_tail * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_data_type_ = 
# 54 "Parser.mly"
                   ( Ast.Int )
# 2593 "Parser.ml"
     in
    _menhir_goto_data_type_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_reduce16 : _menhir_env -> 'ttv_tail * _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let (_menhir_stack, _menhir_s) = _menhir_stack in
    let _1 = () in
    let _v : 'tv_data_type_ = 
# 55 "Parser.mly"
           ( Ast.Byte )
# 2604 "Parser.ml"
     in
    _menhir_goto_data_type_ _menhir_env _menhir_stack _menhir_s _v

and _menhir_goto_data_type_arr_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_data_type_arr_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv123 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2614 "Parser.ml"
    ))) * _menhir_state) = Obj.magic _menhir_stack in
    let (_menhir_s : _menhir_state) = _menhir_s in
    let (_v : 'tv_data_type_arr_) = _v in
    ((let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv121 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2622 "Parser.ml"
    ))) * _menhir_state) = Obj.magic _menhir_stack in
    let (_ : _menhir_state) = _menhir_s in
    let ((_4 : 'tv_data_type_arr_) : 'tv_data_type_arr_) = _v in
    ((let ((_menhir_stack, _menhir_s, (_1 : (
# 12 "Parser.mly"
      (string)
# 2629 "Parser.ml"
    ))), _) = _menhir_stack in
    let _3 = () in
    let _2 = () in
    let _v : 'tv_fpar_def = 
# 52 "Parser.mly"
                                          ( Ast.Fpar_def_ref(_1,_4))
# 2636 "Parser.ml"
     in
    _menhir_goto_fpar_def _menhir_env _menhir_stack _menhir_s _v) : 'freshtv122)) : 'freshtv124)

and _menhir_run14 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack)

and _menhir_run15 : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    let _menhir_stack = (_menhir_stack, _menhir_s) in
    let _menhir_env = _menhir_discard _menhir_env in
    _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack)

and _menhir_goto_option_fpar_list_ : _menhir_env -> 'ttv_tail -> _menhir_state -> 'tv_option_fpar_list_ -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : (('freshtv119 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2659 "Parser.ml"
    ))) * _menhir_state * 'tv_option_fpar_list_) = Obj.magic _menhir_stack in
    ((assert (not _menhir_env._menhir_error);
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_rparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv115 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2669 "Parser.ml"
        ))) * _menhir_state * 'tv_option_fpar_list_) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_col ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv111 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2679 "Parser.ml"
            ))) * _menhir_state * 'tv_option_fpar_list_)) = Obj.magic _menhir_stack in
            ((let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_byte ->
                _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | T_int ->
                _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState19
            | T_proc ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv109) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState19 in
                ((let _menhir_env = _menhir_discard _menhir_env in
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv107) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = _menhir_s in
                ((let _1 = () in
                let _v : 'tv_r_type_ = 
# 63 "Parser.mly"
           ( Ast.Proc )
# 2700 "Parser.ml"
                 in
                _menhir_goto_r_type_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv108)) : 'freshtv110)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState19) : 'freshtv112)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ((('freshtv113 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2714 "Parser.ml"
            ))) * _menhir_state * 'tv_option_fpar_list_)) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv114)) : 'freshtv116)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv117 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2725 "Parser.ml"
        ))) * _menhir_state * 'tv_option_fpar_list_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv118)) : 'freshtv120)

and _menhir_run3 : _menhir_env -> 'ttv_tail -> _menhir_state -> (
# 12 "Parser.mly"
      (string)
# 2733 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s _v ->
    let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_col ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv103 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2745 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_byte ->
            _menhir_run15 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | T_int ->
            _menhir_run14 _menhir_env (Obj.magic _menhir_stack) MenhirState4
        | T_reference ->
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : ('freshtv101 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2759 "Parser.ml"
            ))) = Obj.magic _menhir_stack in
            let (_menhir_s : _menhir_state) = MenhirState4 in
            ((let _menhir_stack = (_menhir_stack, _menhir_s) in
            let _menhir_env = _menhir_discard _menhir_env in
            let _tok = _menhir_env._menhir_token in
            match _tok with
            | T_byte ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv87) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState5 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | T_lbrack ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv83 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | T_rbrack ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv79 * _menhir_state)) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv77 * _menhir_state)) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                        let _3 = () in
                        let _2 = () in
                        let _1 = () in
                        let _v : 'tv_data_type_arr_ = 
# 59 "Parser.mly"
                             (Ast.ByteArr)
# 2793 "Parser.ml"
                         in
                        _menhir_goto_data_type_arr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv78)) : 'freshtv80)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv81 * _menhir_state)) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv82)) : 'freshtv84)
                | T_com | T_rparen ->
                    _menhir_reduce16 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv85 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv86)) : 'freshtv88)
            | T_int ->
                let (_menhir_env : _menhir_env) = _menhir_env in
                let (_menhir_stack : 'freshtv99) = Obj.magic _menhir_stack in
                let (_menhir_s : _menhir_state) = MenhirState5 in
                ((let _menhir_stack = (_menhir_stack, _menhir_s) in
                let _menhir_env = _menhir_discard _menhir_env in
                let _tok = _menhir_env._menhir_token in
                match _tok with
                | T_lbrack ->
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv95 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let _menhir_env = _menhir_discard _menhir_env in
                    let _tok = _menhir_env._menhir_token in
                    match _tok with
                    | T_rbrack ->
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv91 * _menhir_state)) = Obj.magic _menhir_stack in
                        ((let _menhir_env = _menhir_discard _menhir_env in
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv89 * _menhir_state)) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                        let _3 = () in
                        let _2 = () in
                        let _1 = () in
                        let _v : 'tv_data_type_arr_ = 
# 58 "Parser.mly"
                            ( Ast.IntArr)
# 2839 "Parser.ml"
                         in
                        _menhir_goto_data_type_arr_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv90)) : 'freshtv92)
                    | _ ->
                        assert (not _menhir_env._menhir_error);
                        _menhir_env._menhir_error <- true;
                        let (_menhir_env : _menhir_env) = _menhir_env in
                        let (_menhir_stack : ('freshtv93 * _menhir_state)) = Obj.magic _menhir_stack in
                        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv94)) : 'freshtv96)
                | T_com | T_rparen ->
                    _menhir_reduce15 _menhir_env (Obj.magic _menhir_stack)
                | _ ->
                    assert (not _menhir_env._menhir_error);
                    _menhir_env._menhir_error <- true;
                    let (_menhir_env : _menhir_env) = _menhir_env in
                    let (_menhir_stack : 'freshtv97 * _menhir_state) = Obj.magic _menhir_stack in
                    ((let (_menhir_stack, _menhir_s) = _menhir_stack in
                    _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv98)) : 'freshtv100)
            | _ ->
                assert (not _menhir_env._menhir_error);
                _menhir_env._menhir_error <- true;
                _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState5) : 'freshtv102)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState4) : 'freshtv104)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv105 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2873 "Parser.ml"
        )) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv106)

and _menhir_errorcase : _menhir_env -> 'ttv_tail -> _menhir_state -> 'ttv_return =
  fun _menhir_env _menhir_stack _menhir_s ->
    match _menhir_s with
    | MenhirState122 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv9 * _menhir_state * 'tv_fpar_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv10)
    | MenhirState115 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv11 * _menhir_state * 'tv_stmt) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv12)
    | MenhirState108 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv13 * _menhir_state * 'tv_l_value)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv14)
    | MenhirState105 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv15 * _menhir_state)) * _menhir_state * 'tv_cond)) * _menhir_state * 'tv_stmt)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv16)
    | MenhirState103 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv17 * _menhir_state)) * _menhir_state * 'tv_cond)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv18)
    | MenhirState101 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv19 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv20)
    | MenhirState96 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv21 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv22)
    | MenhirState94 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((('freshtv23 * _menhir_state)) * _menhir_state * 'tv_cond)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv24)
    | MenhirState91 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv25 * _menhir_state * 'tv_cond)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv26)
    | MenhirState89 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv27 * _menhir_state * 'tv_cond)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv28)
    | MenhirState83 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv29 * _menhir_state * 'tv_expr) * 'tv_compare_op) = Obj.magic _menhir_stack in
        ((let ((_menhir_stack, _menhir_s, _), _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv30)
    | MenhirState75 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv31 * _menhir_state * 'tv_unary_logic_op) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv32)
    | MenhirState71 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv33 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2946 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv34)
    | MenhirState68 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv35 * _menhir_state * 'tv_expr_list)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv36)
    | MenhirState63 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv37 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv38)
    | MenhirState61 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv39 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv40)
    | MenhirState59 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv41 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv42)
    | MenhirState57 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv43 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv44)
    | MenhirState55 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv45 * _menhir_state * 'tv_expr)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv46)
    | MenhirState49 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv47 * _menhir_state * 'tv_unary_op) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv48)
    | MenhirState46 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv49 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv50)
    | MenhirState45 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv51 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 2995 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv52)
    | MenhirState43 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv53 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv54)
    | MenhirState37 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv55 * _menhir_state)) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv56)
    | MenhirState35 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv57 * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv58)
    | MenhirState34 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((((('freshtv59 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3019 "Parser.ml"
        ))) * _menhir_state * 'tv_option_fpar_list_))) * _menhir_state * 'tv_r_type_) * _menhir_state * 'tv_list_local_def_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv60)
    | MenhirState31 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv61 * _menhir_state * 'tv_local_def) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv62)
    | MenhirState23 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv63 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3033 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv64)
    | MenhirState21 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ((((('freshtv65 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3042 "Parser.ml"
        ))) * _menhir_state * 'tv_option_fpar_list_))) * _menhir_state * 'tv_r_type_) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv66)
    | MenhirState19 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (((('freshtv67 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3051 "Parser.ml"
        ))) * _menhir_state * 'tv_option_fpar_list_))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv68)
    | MenhirState5 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : (('freshtv69 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3060 "Parser.ml"
        ))) * _menhir_state) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv70)
    | MenhirState4 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv71 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3069 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv72)
    | MenhirState2 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : ('freshtv73 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3078 "Parser.ml"
        ))) = Obj.magic _menhir_stack in
        ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv74)
    | MenhirState0 ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv75) = Obj.magic _menhir_stack in
        (raise _eRR : 'freshtv76)

and _menhir_run2 : _menhir_env -> 'ttv_tail * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3090 "Parser.ml"
) -> 'ttv_return =
  fun _menhir_env _menhir_stack ->
    let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_id _v ->
        _menhir_run3 _menhir_env (Obj.magic _menhir_stack) MenhirState2 _v
    | T_rparen ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv7) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState2 in
        ((let _v : 'tv_option_fpar_list_ = 
# 114 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
    ( None )
# 3105 "Parser.ml"
         in
        _menhir_goto_option_fpar_list_ _menhir_env _menhir_stack _menhir_s _v) : 'freshtv8)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState2

and _menhir_discard : _menhir_env -> _menhir_env =
  fun _menhir_env ->
    let lexer = _menhir_env._menhir_lexer in
    let lexbuf = _menhir_env._menhir_lexbuf in
    let _tok = lexer lexbuf in
    {
      _menhir_lexer = lexer;
      _menhir_lexbuf = lexbuf;
      _menhir_token = _tok;
      _menhir_error = false;
    }

and program : (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (
# 39 "Parser.mly"
      (Ast.ast)
# 3128 "Parser.ml"
) =
  fun lexer lexbuf ->
    let _menhir_env =
      let (lexer : Lexing.lexbuf -> token) = lexer in
      let (lexbuf : Lexing.lexbuf) = lexbuf in
      ((let _tok = Obj.magic () in
      {
        _menhir_lexer = lexer;
        _menhir_lexbuf = lexbuf;
        _menhir_token = _tok;
        _menhir_error = false;
      }) : _menhir_env)
    in
    Obj.magic (let (_menhir_env : _menhir_env) = _menhir_env in
    let (_menhir_stack : 'freshtv5) = ((), _menhir_env._menhir_lexbuf.Lexing.lex_curr_p) in
    ((let _menhir_env = _menhir_discard _menhir_env in
    let _tok = _menhir_env._menhir_token in
    match _tok with
    | T_id _v ->
        let (_menhir_env : _menhir_env) = _menhir_env in
        let (_menhir_stack : 'freshtv3) = Obj.magic _menhir_stack in
        let (_menhir_s : _menhir_state) = MenhirState0 in
        let (_v : (
# 12 "Parser.mly"
      (string)
# 3154 "Parser.ml"
        )) = _v in
        ((let _menhir_stack = (_menhir_stack, _menhir_s, _v) in
        let _menhir_env = _menhir_discard _menhir_env in
        let _tok = _menhir_env._menhir_token in
        match _tok with
        | T_lparen ->
            _menhir_run2 _menhir_env (Obj.magic _menhir_stack)
        | _ ->
            assert (not _menhir_env._menhir_error);
            _menhir_env._menhir_error <- true;
            let (_menhir_env : _menhir_env) = _menhir_env in
            let (_menhir_stack : 'freshtv1 * _menhir_state * (
# 12 "Parser.mly"
      (string)
# 3169 "Parser.ml"
            )) = Obj.magic _menhir_stack in
            ((let (_menhir_stack, _menhir_s, _) = _menhir_stack in
            _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) _menhir_s) : 'freshtv2)) : 'freshtv4)
    | _ ->
        assert (not _menhir_env._menhir_error);
        _menhir_env._menhir_error <- true;
        _menhir_errorcase _menhir_env (Obj.magic _menhir_stack) MenhirState0) : 'freshtv6))

# 233 "/home/argyris/.opam/4.05.0/lib/menhir/standard.mly"
  

# 3181 "Parser.ml"
