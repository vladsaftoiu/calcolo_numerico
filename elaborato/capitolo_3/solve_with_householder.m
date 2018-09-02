function [ b ] = solve_with_householder( A, b )
% [ b ] = SOLVE_WITH_HOUSEHOLDER( A, b )
% solves the system Ax=b using the QR Householder factorization of A
%   A: is a m x n matrix of rank = n with m > n
%   b: is the vector of known terms

    [ m, n ] = size(A);
    A = householder_qr(A);
    Qt = eye(m);
    
    for i=1:n
        zero = zeros(i-1, m-i+1);
        low_part = A(i+1:m, i);
        
        Qt = [eye(i-1) zero; zero' (eye(m-i+1)-(2/norm([1; low_part], 2)^2)*([1; low_part]*[1 low_part']))]*Qt;
    end
    
    b = solve_t_sup( triu(A(1:n, :)), Qt(1:n, :)*b );
    
end
