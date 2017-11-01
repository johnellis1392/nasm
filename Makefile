MAIN=main
NASM_FLAGS=-f elf64
LD_FLAGS=-m elf_x86_64


%.o: %.asm
	@nasm -o $@ ${NASM_FLAGS} -- $<

${MAIN}: ${MAIN}.o
	@ld -o $@ ${LD_FLAGS} $<

compile: ${MAIN}

run: compile
	@./${MAIN}

clean:
	@rm -rf ${MAIN} *.o

all: run

.PHONY: all compile run
