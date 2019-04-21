.globl _start
.section .text
.code16

_start:
cli

// Enable A20 Line
movw $0x2401, %ax
int $0x15

// Read one sector
movw $0x7e0, %ax
movw %ax, %es     // buffer=7e00
movw $0x0201, %ax // ah=2, al=1 (read sector)
movw $0x0002, %cx // cyl 0, sector 2
movb $0, %dh      // dl is already set
xorw %bx, %bx     // bx=0
int $0x13

// Enter Protected Mode (32-bit)
lgdt GDTR
movl %cr0, %eax
orl $1, %eax
movl %eax, %cr0
jmp $0x08,$_setseg

.code32
_setseg:
movw $0x10, %ax
movw %ax, %ds
movw %ax, %es
movw %ax, %fs
movw %ax, %gs
movw %ax, %ss

jmp _part2

// Disk timestamp
.space 218-(.-_start)
.space 224-(.-_start)

_part2:
hlt


GDT:
.quad 0                 // Null segment
.quad 0xdf9a000000ffff  // Code segment (R+X)
.quad 0xdf92000000ffff  // Data segment (R+W)

GDTR:
.word (GDTR-GDT)
.long GDT

// Disk Signature
// Partition Table
.space 440-(.-_start)
.space 510-(.-_start)

// Boot Signature
.word 0xaa55
