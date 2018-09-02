function [ x ] = solve_with_lu_pivoting( A, b )
%[ X ] = SOLVE_WITH_LU_PIVOTING( A, b ) returns x that solves the 
% sistem Ax=b given that:
%   A: is a square matrix with det(A) ~= 0
%   b: is the vector of initial equality values
%   the function will use LU factorization of A to solve the sistem 

    n = size(A);
    [lu, p] = LU_pivoting(A);
    
    P = zeros(n);
    for i=1:n
        P(i, p(i)) = 1;
    end
    
    % not really necessary, keep for readability
    L = tril(lu, -1)+eye(n); 
    U = triu(lu);
    
    x = solve_t_inf_udiag(L, P*b);
    x = solve_t_sup(U, x);
    
end