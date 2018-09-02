function [ x ] = solve_t_sup_udiag( A, b )
%[ X ] = SOLVE_T_SUP_UDIAG( A, b ) returns x that solves the 
% sistem Ax=b given that:
%  A is a square matrix upper triangular with its diagonal set to 1
%  b is the vector of initial equality values

    if (~istriu(A)), error('A is not upper triangular'), end
    
    x = b;
    n = size(A);
    
    for i=n : -1 : 1 
       for j=i+1 : n
           x(i) = x(i) - A(i,j) * x(j);
       end
    end
end