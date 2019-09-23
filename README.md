# Alan Compiler

Project developed for ECE-NTUA Compilers course (2017-2018).

## Contributors

* Nikos Mouzakis
* Argyris Mouzakis

## Implementation Details

The project was implemented in OCaml 4.05.0 using OCamllex 4.05.0, mehnir 20180703, LLVM 6.0.0 and Clang 3.8.0-2ubuntu4.

Details concerning the Alan language can be found in alan2018.pdf.

## Instructions

1) make

3) ./alan [-O] [-i|-f] (to read from stdin and output code to stdout)

4) ./alan -O test.alan (to compile .imm .asm and executable )
   
   ./test

5) make distclean 

## Notes

./alan takes input from stdin only if -i or -f flags are given.

Intermediate code goes to test.imm file if a file is given.

Final code goes to test.asm file if a file is given.

The files that are produced are saved in the same directory as the file with the source code.
