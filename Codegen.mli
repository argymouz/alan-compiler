open Semantic
open Llvm

val top_codegen : Semantic.typed_ast -> string -> Llvm.llmodule
