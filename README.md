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

3) ./alan [-o] [-i|-f] < test.alan

4) ./exe (if using -f flag)

5) make distclean 

## Notes

./alan takes input from stdin.

-o flag must go before -i or -f to be registered.

Intermediate code in both cases goes to .imm file.

Final code goes to .asm file.
