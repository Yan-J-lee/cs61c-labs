#include "transpose.h"

/* The naive transpose function as a reference. */
void transpose_naive(int n, int blocksize, int *dst, int *src) {
    for (int x = 0; x < n; x++) {
        for (int y = 0; y < n; y++) {
            dst[y + x * n] = src[x + y * n];
        }
    }
}

/* Implement cache blocking below. You should NOT assume that n is a
 * multiple of the block size. */
void transpose_blocking(int n, int blocksize, int *dst, int *src) {
    // YOUR CODE HERE
    for (int yBase = 0; yBase < n; yBase += blocksize) {
        int yBound = yBase + blocksize;
        if (yBound > n) {
            yBound = n;
        }
        for (int xBase = 0; xBase < n; xBase += blocksize) {
            int xBound = xBase + blocksize;
            if (xBound > n) {
                xBound = n;
            }
            for (int y = yBase; y < yBound; ++y) {
                for (int x = xBase; x < xBound; ++x) {
                    dst[y + x * n] = src[x + y * n];
                }
            }
        }
    }
}
