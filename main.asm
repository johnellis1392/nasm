; # ################## #
; # Declare Entrypoint #
global _start   ; Declared for Linker

; # #### #
; # Data #
section .data
;     align 16
;     v1:     dd 1.1, 2.2, 3.3, 4.4   ; Four Single-precision floats 32 bits each
;     v1dp:   dq 1.1, 2.2             ; Two double-precision floats 64 bits each
;     v2:     dd 5.5, 6.6, 7.7, 8.8

    msg     db      'Hello, World!', 0xa    ; Message to Write
    len     equ     $ - msg                 ; Length of Message


; # ### #
; # BSS #
; section .bss
;     mask1:  resd 1
;     mask2:  resd 1
;     mask3:  resd 1
;     mask4:  resd 1


; # #### #
; # Text #
section .text

; Function Entry Macro
%macro  prologue    1
        push        ebp
        mov         ebp, esp
        sub         esp, %1
%endmacro


; Function Exit Macro
%macro  epilogue    1
        mov         esp, ebp
        pop         ebp
        ret
%endmacro


    _start:

    ; movaps  xmm0, [v1]  ;

    mov     edx, len    ; Message length
    mov     ecx, msg    ; Message to write
    mov     ebx, 1      ; File descriptor (stdout)
    mov     eax, 4      ; System call number (sys_write)
    int     0x80        ; Call Kernel

    mov     eax, 1      ; System call number (sys_exit)
    mov     ebx, 0      ; Set exit status
    int     0x80        ; Call Kernel
