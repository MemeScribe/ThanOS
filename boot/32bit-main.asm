[org 0x7c00]
	mov bp, 0x9000
	mov sp, bp

	mov bx, MSG_REAL_MODE
	call print

	call switch_to_pm
	jmp $

%include "boot-sec_print.asm"
%include "32bit-gdt.asm"
%include "32bit-print.asm"
%include "32bit-switch.asm"

[bits 32]
BEGIN_PM:
	mov ebx, MSG_PROT_MODE
	call print_string_pm
	jmp $

MSG_REAL_MODE db "Making a 32bit Operating system", 0
MSG_PROT_MODE db "You know what else is fun?", 0

times 510-($-$$) db 0
dw 0xaa55
