disk_load:
	pusha
	push dx

	mov ah, 0x02
	mov al, dh
	mov cl, 0x02
	mov ch, 0x00
	mov dh, 0x00

	int 0x13
	jc disk_error

	pop dx
	cmp al, dh
	jne sectors_error
	popa
	ret

disk_error:
	mov bx, disk_error_txt
	call print
	call print_nl
	mov dh, ah
	call print_hex
	jmp disk_loop

sectors_error:
	mov bx, sectors_error_txt
	call print

disk_loop:
	jmp $

disk_error_txt:
	db "Disk read error", 0
sectors_error_txt:
	db "Incorrect number of sectors read", 0
