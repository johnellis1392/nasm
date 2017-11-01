#!/bin/bash

# Watch and build supplied file
infile=${INFILE}
outfile=${OUTFILE}

# _compile() {
#   nasm -o ${outfile}.o -f elf64 -- ${infile}
#   ld -o ${outfile} -m elf_x86_64 ${outfile}.o
# }

# _compile
make compile
while inotifywait --event modify ${infile}; do
  # _compile
  make compile
  echo "Running..."
  make run
  echo ""
  clear
done
