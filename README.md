If the compiler warns that the compiler is adding it's own newline, 
do not worry, I fixed it by moving everything (like the .data) below the syscall to exit

- Any files marked with ".s" is along with the book, Learn to Program with Assembly, authored by Jonathan
Bartlett.
- Any files marked with ".asm" are my own.

- Intel Syntax uses ".asm" and AT&T Syntax uses ".s", although most compilers will not complain about AT&T Syntax being inside of .asm, though I am sure that most GCC compilers will complain if Intel Syntax is inside .s
