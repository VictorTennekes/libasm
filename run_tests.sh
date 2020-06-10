make re
gcc -L . -lasm main.c -g -fsanitize=address
./a.out
make fclean
rm a.out
rm -rf a.out.dSYM
