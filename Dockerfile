FROM ubuntu:latest
ARG INFILE
ARG OUTFILE

WORKDIR /usr/src/app
ENV INFILE=${INFILE}
ENV OUTFILE=${OUTFILE}

# Install Dependencies
RUN apt-get update
RUN apt-get install -y nasm gcc-multilib g++-multilib build-essential inotify-tools

# Compile
COPY . .
RUN nasm -o ${OUTFILE}.o -f elf64 -- ${INFILE}
RUN ld -o ${OUTFILE} -m elf_x86_64 ${OUTFILE}.o

CMD [ "/bin/bash", "-c", "./${OUTFILE}" ]
