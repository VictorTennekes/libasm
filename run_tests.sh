make re
gcc -L . -lasm main.c -g -fsanitize=address
./a.out