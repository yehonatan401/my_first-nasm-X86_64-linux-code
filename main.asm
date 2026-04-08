section .data
    source db "Hello", 0
    src_len equ $ - source

section .bss
    dest resb 6

section .text
    global _start

_start:

    mov rsi, source
    mov rdi, dest
    mov rcx, src_len
    ;===============
    jmp copy_loop
    mov rax,1
    mov rsi,1
    mov rsi,dest
    jmp exit

copy_loop:
    mov al,[rsi]
    mov [rdi],al

    inc rdi
    inc rsi

    dec rcx
    jnz copy_loop

exit:
 mov rax,60
 mov rdi ,0
 syscall
