function [ x ]  = solve_with_ldl( A, b )
%SOLVE_WITH_LDL returns x that solves the sistem Ax=b given that:
%  A is a symmetric positive definite square matrix
%  b is the vector of initial equality values
%  the function will use LDL' factorization of A to solve the sistem 

    n = size(A);
    ldl = LDL(A);
    
    L = tril(ldl, -1)+eye(n); % not really necessary, keep for readability
    
    x = solve_t_inf_udiag(L, b);
    x = x./diag(ldl); % solving diagonal system
    x = solve_t_sup_udiag(L', x);
    
end