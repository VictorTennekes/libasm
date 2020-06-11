; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_push_front_bonus.s                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 14:15:00 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/11 14:15:00 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; void	ft_list_push_front(t_list **begin_list, void *data);

extern _malloc

section.data:
	%define HEAD r12
	%define DATA r13
	%define NEW rax

section.text:
	global	_ft_list_push_front

_ft_list_push_front:
	push r12			; save state of register
	push r13			; save state of register
	cmp rdi, 0			; error checking
	je ret
	cmp rsi, 0			; error checking
	je ret
	mov HEAD, rdi		; move out of argument registers to prepare for malloc
	mov DATA, rsi		; ^^
	mov rdi, 16			; set rdi to value of 2 address pointers: 8 * 2 = 16
	call _malloc
	cmp NEW, 0			; error checkin
	je ret
	mov [NEW], DATA		; move data into the new node
	mov rsi, [HEAD]		; move HEAD to temp register to deal with dereferencing
	mov [NEW + 8], rsi	; putting address pointer into next of node
	mov [HEAD], NEW		; putting the new node as the new head

ret:
	pop r12
	pop r13
	ret					; return