; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_sort_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 19:33:27 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/11 19:33:27 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; void	ft_list_sort(t_list **begin_list, int (*cmp)());

section.data:
    %define NODE r12
    %define FUNC r13
    %define HEAD r14
    %define NEXT r15
    %define SWAPPED rbx

section.text:
    global _ft_list_sort

_ft_list_sort:
    push r12
    push r13
    push r14
    push r15
    push rbx
    cmp rdi, 0
    jz ret
    cmp rsi, 0
    jz ret
    mov HEAD, rdi
    mov FUNC, rsi
	mov SWAPPED, 1

outer_loop:
	cmp SWAPPED, 0
	jz ret
	mov SWAPPED, 0
	mov NODE, [HEAD]
	mov NEXT, [NODE + 8]
	cmp NEXT, 0
	jz ret
inner_loop:
	mov rdi, [NODE]
	mov rsi, [NEXT]
	call FUNC
	cmp rax, 0
	jb swap
resume:
	mov NODE, NEXT
	mov NEXT, [NODE + 8]
	cmp NEXT, 0
	jnz inner_loop
	jmp outer_loop


swap:
	mov rdi, [NODE]
	mov rsi, [NEXT]
	mov [NEXT], rsi
	mov [NODE], rdi
	mov SWAPPED, 1
    jmp resume


ret:
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    ret
