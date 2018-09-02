function [ b ] = solve_bidiagonal_toeplitz( alpha, b )
%[ b ] = SOLVE_BIDIAGONAL_TOEPLITZ( alpha, b ) returns x that solves the 
% sistem Ax=b given that:
%  alpha: is the value which will generate the second diagonal of the matrix
%  b: is the vector of initial equality values
 
    for i = 2 : size(b)
        b(i) = b(i) - alpha*b(i-1);
    end
    
end