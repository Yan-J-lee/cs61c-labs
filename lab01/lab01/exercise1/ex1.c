#include <string.h>
#include "ex1.h"

/* Returns the number of times LETTER appears in STR.
There are two different ways to iterate through a string.
1st way hint: strlen() may be useful
2nd way hint: all strings end in a null terminator */
int num_occurrences(char *str, char letter) {
    /* TODO: implement num_occurances */
    int num = 0;
    while (*str)
    {
        if (*str == letter)
            ++num;
        ++str;
    }
    return num;
}

/* Populates DNA_SEQ with the number of times each nucleotide appears.
Each sequence will end with a NULL terminator and will have up to 20 nucleotides.
All letters will be upper case. */
void compute_nucleotide_occurrences(DNA_sequence *dna_seq) {
    /* TODO: implement compute_nucleotide_occurances */
    int i;
    dna_seq -> A_count = 0;
    dna_seq -> C_count = 0;
    dna_seq -> G_count = 0;
    dna_seq -> T_count = 0;
    for (i = 0; i < strlen(dna_seq -> sequence); ++i) {
        switch (dna_seq -> sequence[i])
        {
        case 'A':
            ++(dna_seq -> A_count);
            break;
        
        case 'C':
            ++(dna_seq -> C_count);
            break;
        
        case 'G':
            ++(dna_seq -> G_count);
            break;
        
        case 'T':
            ++(dna_seq -> T_count);
            break;
        }
    }
    return;
}
