; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 19:20:16 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/10 19:20:16 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; ssize_t	write(int fildes, const void *buf, size_t nbyte);

section.text:
	global _ft_write

error:
	mov rax, -1			; setting the rax register to -1 for error handling
	ret					; return

_ft_write:
	mov rax, 0x2000004	; move the systemcall code for write into rax
	syscall				; systemcall
	jc error			; if carry jump error
	ret					; return
