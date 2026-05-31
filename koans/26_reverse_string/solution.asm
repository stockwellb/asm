%include "syscalls.inc"

global _start

section .data
        str: db "hello", 0
        str_len: equ $ - str

section .bss
        buf: resb str_len

section .text
_start:
        xor rcx, rcx

load_loop:
        cmp byte [str + rcx], 0
        je reverse

        mov al, [str + rcx]
        mov [buf + rcx], al
        inc rcx
        jmp load_loop

reverse:
        mov byte [buf + rcx], 10
        xor r8, r8
        mov r9, str_len - 2

reverse_loop:
        cmp r8, r9
        je write

        mov al, [buf + r8]
        mov bl, [buf + r9]

        mov [buf + r8], bl
        mov [buf + r9], al

        inc r8
        dec r9

        jmp reverse_loop

write:
        mov rax, SYS_WRITE
        mov rdi, STDOUT
        mov rsi, buf
        mov rdx, str_len
        syscall

done:
        mov rax, SYS_EXIT
        mov rdi, 0
        syscall

