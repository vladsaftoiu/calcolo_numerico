function [ x ]  = solve_t_sup( A, b )
%SOLVE_T_SUP returns x that solves the sistem Ax=b given that:
%  A is a square matrix upper triangular
%  b is the vector of initial equality values

    if (~istriu(A)), error('A is not upper triangular'), end
    
    x = b;
    n = size(A);
    
    for i=n : -1 : 1 
       for j=i+1 : n
           x(i) = x(i) - A(i,j) * x(j);
       end
       x(i) = x(i)/A(i,i);
    end
end