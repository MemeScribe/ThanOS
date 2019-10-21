print_hex:
	pusha

	mov cx, 0

hex_loop:
	cmp cx, 4
	je hex_end

	mov ax, dx
	and ax, 0x000f
	add al, 0x30
	cmp al, 0x39
	jle hex_loop_2
	add al, 7

hex_loop_2:
	mov bx, hex_out + 5
	sub bx, cx
	mov [bx], al
	ror dx, 4

	add cx, 1
	jmp hex_loop

hex_end:
	mov bx, hex_out
	call print

	popa
	ret

hex_out:
	db '0x0000', 0
