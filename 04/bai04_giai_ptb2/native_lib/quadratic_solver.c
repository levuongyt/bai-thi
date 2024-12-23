#include <stdio.h>
#include <math.h>

typedef struct {
    double x1;
    double x2;
    int num_solutions;
} Solution;

Solution solve_quadratic(double a, double b, double c) {
    Solution solution;
    double delta = b * b - 4 * a * c;
    if (delta > 0) {
        solution.x1 = (-b + sqrt(delta)) / (2 * a);
        solution.x2 = (-b - sqrt(delta)) / (2 * a);
        solution.num_solutions = 2;
    } else if (delta == 0) {
        solution.x1 = solution.x2 = -b / (2 * a);
        solution.num_solutions = 1;
    } else {
        solution.num_solutions = 0;
    }
    return solution;
}
