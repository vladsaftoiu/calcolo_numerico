clear;

% example 1
A = randi(1000, 170, 15);
b = A*randi(1000, 15, 1);

x_ = solve_with_householder( A, b );
x = A\b;

norm( x - x_)

% example 2 (es. 3.31 book)
A = [3 2 1
    1 2 3 
    1 2 1
    2 1 2];
b = [10 10 10 10]';
norm( A\b - solve_with_householder( A, b) )