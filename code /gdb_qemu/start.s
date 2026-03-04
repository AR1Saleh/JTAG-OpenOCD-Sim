.section .text.init
.global _start

_start:
    la sp, _stack_top   /* initialize stack pointer */
    call main           /* call main */
1:  j 1b                /* infinite loop */

.section .bss
.space 4096             /* 4KB stack */
_stack_top:
