; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_remove_if_bonus.s                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/16 10:07:06 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/16 10:07:06 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

extern _free

section.data:
	%define	NODE r12
	%define LAST r13
	%define	FUNC r14
	%define DATA r15
	%define HEAD rbx

section.text:
	global _ft_list_remove_if

_ft_list_remove_if:
	push r12			; save state of register
	push r13			; save state of register
	push r14			; save state of register
	push r15			; save state of register
	push rbx			; save state of register
	cmp rdi, 0			; error checking
	je ret
	cmp rsi, 0			; error checking
	je ret
	cmp rdx, 0			; error checking
	je ret
	mov HEAD, rdi		; saving argument
	mov NODE, [HEAD]	; saving argument
	mov DATA, rsi		; saving argument
	mov FUNC, rdx		; saving argument
	mov LAST, 0			; saving argument

loop:
	cmp NODE, 0			; check if loop is done
	je ret
	mov rdi, [NODE]		; moving argument for compare function
	mov rsi, DATA		; moving argument for compare function
	call FUNC
	cmp rax, 0			; check if deletion is needed
	je delete
	mov LAST, NODE		; setting the last node before current
	mov NODE, [LAST + 8]	; looping over list
	jmp loop

delete:
	cmp LAST, 0			; check if first node, requires different deletion
	je first_delete
	mov rdi, NODE		; moving argument for free
	mov NODE, [rdi + 8]	; moving to next node
	mov [LAST + 8], NODE	; rerouting path around node that requires deletion
	call _free
	jmp loop

first_delete:
	mov rdi, NODE		; moving argument for free
	mov NODE, [rdi + 8]	; moving to the next node
	call _free
	mov [HEAD], NODE	; updating head of list
	jmp loop

ret:
	pop rbx				; retrieving previously saved register
	pop r15				; retrieving previously saved register
	pop r14				; retrieving previously saved register
	pop r13				; retrieving previously saved register
	pop r12				; retrieving previously saved register
	ret					; return