/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: greed <greed@student.codam.nl>               +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/10 23:24:48 by greed         #+#    #+#                 */
/*   Updated: 2020/07/22 20:12:30 by greed         ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <errno.h>

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

/*static void	test_ft_read(void)*/
/*{*/
	/*int			fd;*/
	/*static char	buf[50];*/
	/*size_t		out;*/

	/*printf("READ\n");*/
	/*fd = open("readtest.txt", O_RDONLY);*/
	/*out = ft_read(fd, buf, 49);*/
	/*perror("read error");*/
	/*printf("out: %ld | buf: %s\n\n", out, buf);*/
/*}*/

static void    test_ft_read(void)
{
    int            fd;
    static char    buf[50];
    static char    buf1[50];
    size_t        out;
    size_t        working;

    printf("READ\n");
    fd = open("readtest.txt", O_RDONLY);
    out = ft_read(-1, buf, 50);
    perror("write error");
    printf("\n-- Valid Read --\n");
    working = ft_read(fd, buf1, 50);
    printf("out: %ld | buf: %s | working: %ld | Buf1: %s\n\n", out, buf, working, buf1);
}

static void	test_ft_write(void)
{
	char	str[] = "Yeet";
	size_t	out;

	printf("WRITE\n");
	out = ft_write(-1, str, strlen(str));
	printf("some stuff\n");
	perror("write error");
	// if ((int)out == -1)
	// 	exit(1);
	printf(" <- Written string | str_to_write: %s | out: %ld\n\n", str, out);
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

int		main(void)
{
	printf("\n\e[1;34m\t***\t---\tTESTING MANDATORY\t---\t***\n\e[0m");
	test_ft_write();
	test_ft_read();
	test_ft_strlen();
	test_ft_strcpy();
	test_ft_strcmp();
	test_ft_strdup();
	return (0);
}
