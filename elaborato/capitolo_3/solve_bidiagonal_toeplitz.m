function [ b ]  = solve_bidiagonal_toeplitz( alpha, b )
%SOLVE_BIDIAGONAL_TOEPLITZ returns x that solves the sistem Ax=b given that:
%  alpha is the value which will generate the second diagonal of the matrix
%  b is the vector of initial equality values
%  A matrix is implicitlty generated as N x N where N = size(b), the main
%  diagonal will be all ones and the second diagonal will be all alphas
 
    for i = 2 : size(b)
        b(i) = b(i) - alpha*b(i-1);
    end
    
end