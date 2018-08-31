clear;

col = [ 1 1 2 2 3 3 4 4 5 5 ]';
A = [ ones(10,1), col, col.^2 ];
b = [ 2.9, 3.1, 6.9, 7.1, 12.9, 13.1, 20.9, 21.1, 30.9, 31.1 ]';

disp('x: ')
x_ = solve_with_householder( A , b )

disp('r: ')
r = A * x_- b


