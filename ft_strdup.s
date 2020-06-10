; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 22:53:58 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/10 22:53:58 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; char	*strdup(const char *s1);

extern _ft_strlen
extern _ft_strcpy
extern _malloc

section.text:
	global _ft_strdup

_ft_strdup:
	cmp rdi, 0		; comparing input to check if not empty
	je error		; jump if equals
	call _ft_strlen
	push rdi		; push rdi to stack to save src string
	inc rax			; increment rax to deal with 0 terminator
	mov rdi, rax	; move contents of rax into rdi register
	call _malloc
	cmp rax, 0		; comparing retun to see if malloc succeeded
	je error		; jump is equals
	mov rdi, rax	; move contents of rax into rdi register
	pop rsi			; pop string saved on stack into second parameter
	call _ft_strcpy
	ret				; return

error:
	mov rax, 0		; set rax to 0
	ret				; return