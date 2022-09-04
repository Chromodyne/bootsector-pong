loop:
	jmp	loop

times 510-($-$$) db 0 	;Write zeroes.
dw	0xAA55		;Flag sector as bootable.
