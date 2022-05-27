#include <stdio.h>
#include "bit_ops.h"

/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {
    /* YOUR CODE HERE */
    x = x >> n;  // srl n bits, then the LSBis the Nth bit of x
    return (x & 1); /* bit-wise and with 0...01 (mask) to extract the LSB */
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    /* YOUR CODE HERE */
    *x &= ~(1 << n);
    *x |= v << n;
}

/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {
    /* YOUR CODE HERE */
    *x = *x ^ (1 << n);
}

