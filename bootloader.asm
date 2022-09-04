	mov	ah, 0x0E	;Enter teletype (TTY) mode
	mov	al, 'H'		;Store H char in lower AX register.
	int	0x10		;General video interrupt.
	mov	al, 'E'
	int	0x10
	mov	al, 'L'
	int	0x10
	mov	al, 'L'
	int 	0x10
	mov	al, 'O'
	int	0x10

jmp $

times 510-($-$$) db 0 	;Write zeroes.
dw	0xAA55		;Flag sector as bootable.
