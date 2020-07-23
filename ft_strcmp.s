; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 18:46:24 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/10 18:46:24 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; int	strcmp(const char *s1, const char *s2)

section.text:
	global _ft_strcmp

_ft_strcmp:
	mov rax, 0				; setting return register to 0

loop:
	mov	r8b, [rdi + rax]	; moving byte with index rax from s1 to r8b register
	mov r9b, [rsi + rax]	; moving byte with index rax from s2 to r9b register
	inc rax					; incrementing rax
	cmp r8b, r9b			; comparing the byte in r8b to the byte in r9b
	jne ret					; jump if not equal
	cmp r8b, 0				; compare the byte in r8b with 0
	je ret					; jump if equal
	jmp loop				; jump to loop

ret:
	sub r8b, r9b			; subtracting the r9b register from the r8b
	movsx rax, r8b			; moving the r8b register into rax with a sign extention
	ret						; return