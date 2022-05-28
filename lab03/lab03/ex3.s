.globl main

.data
source:
    .word   3
    .word   1
    .word   4
    .word   1
    .word   5
    .word   9
    .word   0
dest:
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0
    .word   0

.text
fun:
    addi t0, a0, 1  # t0 = x + 1
    sub t1, x0, a0  # t1 = -x
    mul a0, t0, t1  # a0 = (x + 1) * x
    jr ra

main:
    # BEGIN PROLOGUE
    addi sp, sp, -20
    sw s0, 0(sp)
    sw s1, 4(sp)
    sw s2, 8(sp)
    sw s3, 12(sp)
    sw ra, 16(sp)
    # END PROLOGUE
    addi t0, x0, 0  # k = 0
    addi s0, x0, 0  # sum = 0
    la s1, source  # s1 = &source[0]
    la s2, dest  # s2 = &dest[0]
loop:
    slli s3, t0, 2  # s3 = t0 * 4 = k * 4, byte-addressing
    add t1, s1, s3  # t1 = &source[k]
    lw t2, 0(t1)  # t2 = source[k]
    beq t2, x0, exit  # source[k] != 0
    add a0, x0, t2  # prepare the argument source[k]
    addi sp, sp, -8
    sw t0, 0(sp)  # store k
    sw t2, 4(sp)  # store source[k]
    jal fun  # call fun with source[k]
    lw t0, 0(sp)  # load the old value of k
    lw t2, 4(sp)  # load the old value of source[k]
    addi sp, sp, 8
    add t2, x0, a0  # source[k] = fun(source[k])
    add t3, s2, s3  # t3 = &dest[k]
    sw t2, 0(t3)  # desk[k] = source[k] = fun(source[k])
    add s0, s0, t2  # sum += desk[k]
    addi t0, t0, 1  # k += 1
    jal x0, loop
exit:
    add a0, x0, s0  # a0 = sum, return sum
    # BEGIN EPILOGUE
    lw s0, 0(sp)
    lw s1, 4(sp)
    lw s2, 8(sp)
    lw s3, 12(sp)
    lw ra, 16(sp)
    addi sp, sp, 20
    # END EPILOGUE
    jr ra
