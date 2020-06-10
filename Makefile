# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: vtenneke <vtenneke@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2020/06/10 16:20:31 by vtenneke      #+#    #+#                  #
#    Updated: 2020/06/10 16:20:31 by vtenneke      ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME =	libasm.a

SRC		=	ft_strlen.s\
			ft_strcpy.s\
			ft_strcmp.s\
			ft_write.s\
			ft_read.s\
			ft_strdup.s
OBJ		=	$(SRC:%.s=%.o)
SFLAGS	=	-fmacho64	

all: $(NAME)

%.o: %.s
	nasm $(SFLAGS) $< -o $@

$(NAME): $(OBJ)
	ar -rcs $(NAME) $^

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re