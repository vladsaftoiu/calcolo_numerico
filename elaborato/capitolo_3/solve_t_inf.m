function [ x ]  = solve_t_inf( A, b )
%[ X ]  = SOLVE_T_INF( A, b ) returns x that solves the sistem Ax=b given that:
%  A: is a square matrix lower triangular
%  b: is the vector of initial equality values

    if (~istril(A)), error('A is not lower triangular'), end
    
    x = b;
    n = size(A);
    
    for i=1 : n 
       for j=1 : i-1
           x(i) = x(i) - A(i,j) * x(j);
       end
       x(i) = x(i)/A(i,i);
    end
end