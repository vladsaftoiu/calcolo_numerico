function [ x ]  = solve_t_inf_udiag( A, b )
%SOLVE_T_INF_UDIAG returns x that solves the sistem Ax=b given that:
%  A is a square matrix lower triangular with its diagonal set to 1
%  b is the vector of initial equality values

    if (~istril(A)), error('A is not lower triangular'), end
    
    x = b;
    n = size(A);
    
    for i=1 : n 
       for j=1 : i-1
           x(i) = x(i) - A(i,j) * x(j);
       end
    end
end