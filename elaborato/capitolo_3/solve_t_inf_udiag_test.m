
A = [ 1,0,0,0,0 ; 3,1,0,0,0 ; -1,2,1,0,0 ; 2,-4,-2,1,0 ; 3,3,1,3,1 ];
b = [ 4,-5,-38,77,-40 ]';

% find and display solution
x = solve_t_inf_udiag( A, b )

% test solution against the sistem
A*x - b

