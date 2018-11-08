.globl  nCr
.type   nCr, @function

nCr:
        movl    0x04(%esp), %eax
        movl    0x08(%esp), %ebx
        movl    %eax, %ecx
        subl    %ebx, %eax
        pushl   %eax
        pushl   %ecx

        call    factorial

        popl    %ecx
        movl    %eax, %ecx
        pushl   %ebx

        call    factorial

        popl    %ebx
        movl    %eax, %ebx

        call    factorial

        imul    %ebx, %eax
        movl    $0, %edx
        movl    %eax, %ebx
        movl    %ecx, %eax
        div     %ebx
        popl    %ebx

        ret


.globl  factorial
.type   factorial, @function

factorial:
        pushl   %ecx
        movl    0x08(%esp), %ecx
        movl    $1, %eax

.loop:
        cmp     $0, %ecx
        je      .quit
        imul    %ecx, %eax
        dec     %ecx
        jmp     .loop

.quit:
        popl    %ecx
        ret
               
