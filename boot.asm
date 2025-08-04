ORG 0

; originally we set org 0x7c0 and not 0, but its imp to set org 0 bec
; if processor sets dds tp 0x7c0 and org- 0x7c0
;then bios will load into [0x7c0 *16 +0x7c00] instead of 0x7c00

BITS 16
_start:
    jmp short start
    nop

times 33 db 0

start:
    jmp 0x7c0:step2



step2: 
    cli ; clear interrupts 

    ; this is done to take conrtol of the segment registers and not boot into faulty memory block

    mov ax, 0x7c0
    mov ds, ax
    mov es, ax
    mov ax, 0x00
    mov ss, ax
    mov sp, 0x7c00

    sti ; enables interrupts

    mov si, message 
    call print
    jmp $

print:
    mov bx,0

.loop:
    lodsb
    cmp al,0
    je .done
    call print_char
    jmp .loop

.done:
    ret

print_char:
    mov ah, 0eh
    int 0x10
    ret

message: 
    db 'hello world!' , 0

times 510 - ($-$$) db 0
dw 0xAA55
