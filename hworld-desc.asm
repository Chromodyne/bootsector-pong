BITS	16			;Specifies to use 16-bit Real Address Mode since bootsector is not in protected mode.
	mov	ax, 0x07C0	;Load the bootloader address into AX register.
	mov	ds, ax		;Set data segment to beginning of bootloader.

	xor	ax, ax		;Set ax to zero (0)
	int	0x10		;Sets video mode to 40x25 text mode w/ 16 color grayscale due to al being 00h from the above line

	mov	si, msg_h	;Set the stack index to the memory address of the "Hello, World!" message.
	mov	ah, 0x0E	;Enter teletype (TTY) mode.


loop:
	
	lodsb			;Load byte at address stored in si into al.
	int	0x10		;Executes teletype mode printing "Hello, World!" which is stored in si due to previous line.

	test	al, al		;Logical AND operation.
	jnz	loop		;If not zero, loop again.

	jmp	$		;Loop at current address indefinitely.

msg_h	db	"Hello, World!", 0		;Hello world string.

	times	510-($-$$)	db	0	;Write zeores.
	dw	0xAA55				;Flag as bootable.
