; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: vtenneke <vtenneke@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2020/06/10 21:19:29 by vtenneke      #+#    #+#                  ;
;    Updated: 2020/06/10 21:19:29 by vtenneke      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; ssize_t	read(int fildes, void *buf, size_t nbyte);

section.text:
	global _ft_read

_ft_read:
	mov rax, 0x2000003	; move the systemcall code for read into rax
	syscall				; systemcall
	jc error			; if carry jump error
	ret					; return

error:
	mov rax, -1			; setting the rax register to -1 for error handling
	ret					; return
