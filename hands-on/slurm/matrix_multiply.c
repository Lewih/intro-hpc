#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

#define N 5000  // Size of the matrix (you can reduce this for smaller prints)

void print_matrix(double matrix[N][N], const char *name);

int main() {
    double A[N][N], B[N][N], C[N][N];
    int i, j, k;

    // Initialize matrices A and B
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            A[i][j] = rand() % 10;  // Random values between 0 and 9
            B[i][j] = rand() % 10;
            C[i][j] = 0;  // Initialize result matrix C to 0
        }
    }

    // Perform matrix multiplication with OpenMP
    #pragma omp parallel for private(i, j, k) shared(A, B, C)
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            for (k = 0; k < N; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }

    // Print matrices (you can limit size to avoid large output)
    printf("Matrix A:\n");
    print_matrix(A, "A");

    printf("Matrix B:\n");
    print_matrix(B, "B");

    printf("Matrix C (Result):\n");
    print_matrix(C, "C");

    printf("Matrix multiplication completed.\n");
    return 0;
}

// Function to print a matrix (prints a portion if too large)
void print_matrix(double matrix[N][N], const char *name) {
    int i, j;
    int limit = (N > 10) ? 10 : N;  // Limit print size for large matrices
    printf("Printing first %d x %d elements of matrix %s:\n", limit, limit, name);
    for (i = 0; i < limit; i++) {
        for (j = 0; j < limit; j++) {
            printf("%6.2f ", matrix[i][j]);
        }
        printf("\n");
    }
    if (N > 10) {
        printf("...\n(Matrix %s truncated for display)\n", name);
    }
}
