BITS	16
	mov	ax, 0x07C0
	mov	ds, ax

	xor	ax, ax
	int	0x10

	mov	si, msg_h
	mov	ah, 0x0E


loop:
	
	lodsb
	int	0x10

	test	al, al
	jnz	loop

	jmp	$

msg_h	db	"Hello, World!", 0

	times	510-($-$$)	db	0
	dw	0xAA55
