; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 18:11:25 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/10 18:11:25 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; char	*strcpy(char * dst, const char * src);

section.text:
	global _ft_strcpy

_ft_strcpy:
	mov rax, 0			; setting return register to 0

loop:
	mov cl, [rsi + rax]	; moving byte with index rax from src to cl register
	mov [rdi + rax], cl	; moving the byte with index rax in the cl register to dst
	cmp cl, 0			; comparing the byte in the cl register with 0
	je ret				; jump if equal
	inc rax				; incrementing rax
	jmp loop			; jump to loop

ret:
	mov rax, rdi		; move dst into rax
	ret					; return