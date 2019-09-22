make lib -C lib

ar -cvqs lib.a lib/*.o
objcopy --redefine-syms=change_syms lib.a

make clean -C lib
