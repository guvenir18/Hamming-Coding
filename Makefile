main: main_skeleton.o decode.o encode.o
	gcc main_skeleton.o decode.o encode.o -o main

main_skeleton.o: main_skeleton.c
	gcc -c main_skeleton.c -o main_skeleton.o

decode.o: decode.asm
	nasm -f elf32 decode.asm -o decode.o

encode.o: encode.asm
	nasm -f elf32 encode.asm -o encode.o

clean:
	rm -f *.o main