; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 16:21:26 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/10 16:21:26 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; size_t	ft_strlen(const char *s);

section.text:
	global _ft_strlen

_ft_strlen:
	mov rax, 0			; setting return register to 0
	jmp loop			; jump to the loop to avoid instantly increasing rax

increment:
	inc rax				; incrementing rax
loop:
	mov cl, [rdi + rax]	; moving byte with index rax to cl register
	cmp cl, 0			; comparing the byte in cl register with null byte
	jne increment		; jump if not equal to
	ret					; return