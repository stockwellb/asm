extern printf

section .data
fmt_str db "%s", 10, 0
fmt_reg db "%s = %lld", 10, 0

section .text

%macro print_str 1
    sub rsp, 8
    mov rdi, fmt_str
    mov rsi, %1
    xor rax, rax
    call printf
    add rsp, 8
%endmacro

%macro print_reg 2
    sub rsp, 8
    mov rdi, fmt_reg
    mov rsi, %1
    mov rdx, %2
    xor rax, rax
    call printf
    add rsp, 8
%endmacro
