.globl factorial

.data
n: .word 7

.text
main:
    la t0, n  # t0 = &n
    lw a0, 0(t0)  # a0 = n
    jal ra, factorial  # call the func with a0

    addi a1, a0, 0  # a1 = n
    addi a0, x0, 1  # a0 = 1
    ecall # Print Result

    addi a1, x0, '\n'  # a1 = '\n'
    addi a0, x0, 11  # a0 = 11
    ecall # Print newline

    addi a0, x0, 10  # a0 = 10
    ecall # Exit

factorial:
    # YOUR CODE HERE
    addi sp, sp, -8
    sw a0, 0(sp)  # store n onto the stack
    sw ra, 4(sp)

    addi t0, a0, -1  # t0 = n - 1
    beq t0, x0, done  # base case
    addi a0, a0, -1  # a0 = n - 1
    jal ra, factorial  # call the func with n - 1
    addi t1, a0, 0  # return from jal, move result of fact(n-1) to t1
    lw a0, 0(sp)  # load the old value of n
    lw ra, 4(sp)  # load the old return address
    addi sp, sp, 8
    mul a0, a0, t1  # return a0 = n * fact(n-1)
    jr ra  # return to caller

done:
    addi a0, x0, 1  # return 1
    addi sp, sp, 8
    jr ra  # jalr x0, 0(x1)