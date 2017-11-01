bits    32
extern  _printf, _scanf
global  _main

section .data
    message     dw  "Hello!"
    lenmessage  equ $ - message

section .text
_main:
    pushad

    mov     edx, lenmessage
    mov     ecx, message
    mov     eax, 4          ; Write Interrupt Code
    int     0x80

    popad
    ret
