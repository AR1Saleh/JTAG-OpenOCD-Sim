
main.elf:     file format elf32-littleriscv


Disassembly of section .text:

80001000 <_start>:
.section .text.init
.global _start

_start:
    la sp, _stack_top   /* initialize stack pointer */
80001000:	00001117          	auipc	sp,0x1
80001004:	03a10113          	addi	sp,sp,58 # 8000203a <_stack_top>
    call main           /* call main */
80001008:	2011                	c.jal	8000100c <main>
1:  j 1b                /* infinite loop */
8000100a:	a001                	c.j	8000100a <_start+0xa>

8000100c <main>:
int main(void){
8000100c:	1101                	c.addi	sp,-32
8000100e:	ce06                	c.swsp	ra,28(sp)
80001010:	cc22                	c.swsp	s0,24(sp)
80001012:	1000                	c.addi4spn	s0,sp,32
    int a=2;
80001014:	4789                	c.li	a5,2
80001016:	fef42623          	sw	a5,-20(s0)
    int b=4;
8000101a:	4791                	c.li	a5,4
8000101c:	fef42423          	sw	a5,-24(s0)
    int c;
        c=a+b;   
80001020:	fec42703          	lw	a4,-20(s0)
80001024:	fe842783          	lw	a5,-24(s0)
80001028:	97ba                	c.add	a5,a4
8000102a:	fef42223          	sw	a5,-28(s0)
8000102e:	4781                	c.li	a5,0
80001030:	853e                	c.mv	a0,a5
80001032:	40f2                	c.lwsp	ra,28(sp)
80001034:	4462                	c.lwsp	s0,24(sp)
80001036:	6105                	c.addi16sp	sp,32
80001038:	8082                	c.jr	ra
