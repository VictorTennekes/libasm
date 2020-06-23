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
B_SRC	= 	ft_list_size_bonus.s\
			ft_list_push_front_bonus.s\
			ft_list_remove_if_bonus.s\
			ft_list_sort_bonus.s
OBJ		=	$(SRC:%.s=%.o)
B_OBJ	=	$(B_SRC:%.s=%.o)
TARGETS	=	$(OBJ)
SFLAGS	=	-fmacho64	

ifeq ($(BONUS),1)
TARGETS += $(B_OBJ)
endif

all: $(NAME)

%.o: %.s
	nasm $(SFLAGS) $< -o $@

$(NAME): $(TARGETS)
	ar -rcs $(NAME) $^

clean:
	rm -rf $(OBJ) $(B_OBJ)

fclean: clean
	rm -rf $(NAME)
	rm -f bonus

bonus:
	rm -f $(NAME)
	@BONUS=1 make $(NAME)
	@touch bonus

re: fclean all

.PHONY: all clean fclean re