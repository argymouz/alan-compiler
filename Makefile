.PHONY: clean distclean 

EXEFILE=alan
MLFILES= Hashcons.ml Identifier.ml Error.ml Types.ml Symbol.ml \
   Ast.ml Parser.ml ParserError.ml Lexer.ml Semantic.ml Codegen.ml Main.ml
MLIFILES=Hashcons.mli Identifier.mli Error.mli Types.mli Symbol.mli \
   Ast.mli Parser.mli ParserError.mli Lexer.mli Semantic.mli Codegen.mli
CMOFILES=$(patsubst %.ml,%.cmo,$(MLFILES))
CMIFILES=$(patsubst %.ml,%.cmi,$(MLFILES))
OBJFILES=$(patsubst %.ml,%.o,$(MLFILES))
PARSERFILES=Parser.ml Parser.mli Parser.output Lexer.ml
SRCFILES=Makefile extend.ml Lexer.mll Parser.mly Semantic.ml Codegen.ml \
  $(filter-out Parser.% Lexer.%,$(MLFILES)) \
  $(filter-out Parser.%,$(MLIFILES))

CAMLP5_FLAGS=-pp "camlp5o ./extend.cmo"
OCAMLC_FLAGS=
OCAMLC=ocamlc $(OCAMLC_FLAGS)
OCAMLDEP=ocamldep
PACKAGE= -package llvm -package llvm.analysis -package llvm.target -package llvm.scalar_opts -package llvm.all_backends -package unix

all: $(CMIFILES) $(EXEFILE) lib.a

$(EXEFILE): Parser.mli Lexer.ml $(CMOFILES)
	ocamlfind $(OCAMLC) $(PACKAGE) -linkpkg -o $@ $(CMOFILES) 

extend.cmo: extend.ml
	$(OCAMLC) -pp "camlp5o pa_extend.cmo q_MLast.cmo" -I `camlp5 -where` -c $<

lib.a:
	./libs.sh

%.cmi: %.mli extend.cmo
	ocamlfind $(OCAMLC) $(CAMLP5_FLAGS) $(PACKAGE) -c $<

%.cmo %.cmi: %.ml extend.cmo
	ocamlfind $(OCAMLC) $(CAMLP5_FLAGS) $(PACKAGE) -c $<

Parser.ml Parser.mli: Parser.mly
	menhir -v Parser.mly

Lexer.ml: Lexer.mll
	ocamllex Lexer.mll

-include depend

depend: $(MLFILES) $(MLIFILES) extend.cmo
	$(OCAMLDEP) $(CAMLP5_FLAGS) $(INCLUDES) \
          $(filter-out extend.cmo,$^) > .depend


clean:
	$(RM) $(CMOFILES) $(CMIFILES) $(OBJFILES) $(EXEFILES) \
           extend.cmi extend.cmo lib.a\
           $(patsubst %,%.cm?,$(EXEFILES)) $(PARSERFILES) pplib.cma *~

distclean: clean
	$(RM) $(EXEFILE) .depend

