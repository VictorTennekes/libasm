make bonus
gcc -I . -L . -lasm main.c ft_list_print.c -g -fsanitize=address
./a.out
make fclean
rm a.out
rm -rf a.out.dSYM
