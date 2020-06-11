/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_list_print.c                                    :+:    :+:            */
/*                                                     +:+                    */
/*   By: vtenneke <vtenneke@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/06/11 14:11:32 by vtenneke      #+#    #+#                 */
/*   Updated: 2020/06/11 14:11:32 by vtenneke      ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include "libasm.h"

void	ft_list_print(t_list *head)
{
	while (head)
	{
		printf("%s", (char *)head->data);
		head = head->next;
		if (head)
			printf("->");
		else
			printf("\n");
	}
}