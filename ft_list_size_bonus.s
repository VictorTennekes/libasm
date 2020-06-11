; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_list_size_bonus.s                               :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/11 14:14:41 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/11 14:14:41 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; int	ft_list_size(t_list *begin_list);

section.text:
	global _ft_list_size

_ft_list_size:
	mov rax, 0			; setting counter to 0
	cmp rdi, 0			; error checking
	je error

increment:
	inc rax				; incrementing counter
loop:
	mov rcx, [rdi + 8]	; setting rcx register to the next node in list
	mov rdi, rcx		; setting rdi to rcx to continue loop
	cmp rdi, 0			; check if end is reached
	jne increment		; jump not equal
	ret					; return

error:
	mov rax, -1			; error handling
	ret