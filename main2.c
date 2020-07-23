/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: vtenneke <vtenneke@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/10 18:17:45 by vtenneke      #+#    #+#                 */
/*   Updated: 2020/06/10 18:17:45 by vtenneke      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <errno.h>

extern int errno;

int		ft_item_cmp(void *item1, void *item2)
{
	size_t	len1;
	size_t	len2;

	len1 = ft_strlen((char *)item1);
	len2 = ft_strlen((char *)item2);
	if (len1 > len2)
		return (1);
	return (0);
}

static void	test_ft_read(void)
{
	int			fd;
	static char	buf[50];
	int			out;

	printf("READ\n");
	fd = open("readtest.txt", O_RDONLY);
	out = ft_read(fd, buf, 49);
	printf("out: %i | errno: %i | buf: %s\n\n", out, errno, buf);
}

static void	test_ft_write(void)
{
	char	str[] = "Yeet";
	size_t	out;

	printf("WRITE\n");
	out = ft_write(1, str, strlen(str));
	if ((int)out == -1)
		exit(1);
	printf(" <- Written string | str_to_write: %s | errno: %i | out: %ld\n\n", str, errno, out);
}

static void	test_ft_strlen(void)
{
	char	str[] = "0123456789";
	size_t	out;

	out = ft_strlen(str);
	printf("STRLEN\n");
	printf("out: %ld | str: %s\n\n", out, str);
}

static void	test_ft_strcpy(void)
{
	char	dest[] = "lalal";
	char	src[] = "grr";
	char	*ret;

	ret = NULL;
	printf("STRCPY\n");
	printf("before:\ndest: %s | src: %s | ret: %p\n", dest, src, ret);
	ret = ft_strcpy(dest, src);
	printf("after:\ndest: %s | src: %s | ret: %p\n\n", dest, src, ret);
}

static void	test_ft_strcmp(void)
{
	char	s1[] = "lalala";
	char	s2[] = "lalalb";
	int		out;

	printf("STRCMP\n");
	out = ft_strcmp(s1, s2);
	printf("s1: %s | s2: %s | ret: %d\n\n", s1, s2, out);
}

static void	test_ft_strdup(void)
{
	char	str[] = "wkdfldf";
	char	*dup = NULL;

	printf("STRDUP\n");
	dup = ft_strdup(str);
	printf("str: %s | dup: %s\n\n", str, dup);
	free(dup);
}

static void	test_ft_list_push_front(void)
{
	t_list	*head;

	head = malloc(sizeof(t_list));
	if (!head)
		return ;
	printf("LST_PUSHFRONT\n");
	head->data = "oldhead";
	head->next = NULL;
	ft_list_push_front(&head, "head");
	printf("format: head->elem1\n");
	ft_list_print(head);
	printf("\n");
}

static void	test_ft_list_size(void)
{
	t_list	*head;
	size_t	out;

	head = NULL;
	printf("LST_SIZE\n");
	ft_list_push_front(&head, "list1");
	ft_list_push_front(&head, "list2");
	ft_list_push_front(&head, "list3");
	ft_list_print(head);
	out = ft_list_size(head);
	printf("out: %ld\n\n", out);
}

static void	test_ft_strchr(void)
{
	char	str[] = "laalalglla";
	char	*ret;

	printf("STRCHR\n");
	ret = ft_strchr(str, 'g');
	printf("str: %s, chr: %c | ret: %s\n\n", str, 'g', ret);
}

static void	test_ft_atoi_base(void)
{
	char	str[] =  "XXX";
	char	base[] = "OoXx";
	int		ret;

	ret = 0;
	printf("ATOI_BASE\n");
	ret = ft_atoi_base(str, base);
	printf("str: %s | base: %s | num: %d\n\n", str, base, ret);
}

static void	test_ft_list_sort(void)
{
	t_list	*head;
	size_t	size;

	head = NULL;
	ft_list_push_front(&head, "1");
	ft_list_push_front(&head, "12");
	ft_list_push_front(&head, "123");
	ft_list_push_front(&head, "1234");
	ft_list_push_front(&head, "12345");
	ft_list_push_front(&head, "123456");
	ft_list_push_front(&head, "1234567");
	ft_list_push_front(&head, "12345678");
	ft_list_push_front(&head, "123456789");
	printf("LIST_SORT\n");
	size = ft_list_size(head);
	printf("before:\n");
	ft_list_print(head);
	ft_list_sort(&head, &ft_item_cmp);
	printf("after:\n");
	ft_list_print(head);
	printf("\n");
}

static int		int_cmp(char *a, char *b)
{
	return (atoi(a) > atoi(b) ? 1 : 0);
}

static void	test_ft_list_sort_int(void)
{
	t_list	*head;
	size_t	size;

	head = NULL;
	ft_list_push_front(&head, "4");
    ft_list_push_front(&head, "800");
    ft_list_push_front(&head, "3");
    ft_list_push_front(&head, "4");
    ft_list_push_front(&head, "50");
    ft_list_push_front(&head, "64");
    ft_list_push_front(&head, "0");
    ft_list_push_front(&head, "22");
    ft_list_push_front(&head, "444");
	printf("LIST_SORT INT\n");
	printf("before:\n");
	ft_list_print(head);
	ft_list_sort(&head, &int_cmp);
	// perror("IM HERE BITCH");
	printf("after:\n");
	ft_list_print(head);
	printf("\n");
}


static void	test_ft_itoa_base(void)
{
	char	base[] = "OoXx";
	char	*ret;
	int		num;

	printf("ITOA_BASE\n");
	num = -42;
	ret = ft_itoa_base(num, base);
	printf("num: %d | base: %s | str: %s\n\n", num, base, ret);
}

static void	test_ft_list_remove_if(void)
{
	t_list	*head = NULL;

	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	ft_list_push_front(&head, "DELETE_ME");
	ft_list_push_front(&head, "list");
	printf("LIST_REMOVE_IF\n");
	ft_list_print(head);
	ft_list_remove_if(&head, "DELETE_ME", &ft_strcmp);
	ft_list_print(head);
	printf("\n");
}

int		main(void)
{
	test_ft_write();
	test_ft_read();
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_strdup();
	test_ft_list_push_front();
	test_ft_list_size();
	// test_ft_strchr();
	// test_ft_atoi_base();
	// test_ft_itoa_base();
	test_ft_list_sort();
	test_ft_list_sort_int();
	test_ft_list_remove_if();
	return (0);
}
