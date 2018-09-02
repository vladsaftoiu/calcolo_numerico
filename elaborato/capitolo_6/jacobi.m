function [ x, i ] = jacobi( A, b, tol, x0, maxit )
% [ x, i ] = JACOBI( A, b, tol, x0, maxit )
% iterative method to find the solution to Ax=b system, with A a square
% M-matrix, also the number of iterations is returned.
%   A: is a square M-matrix 
%   b: is the known values vector
%   tol: is the tolerance used for break condition
%   [x0]: optional, is the starting solution vector
%   [maxit]: optional, is the maximum number of iterations allowed

    n = length(b);
    D = diag(A);
    
    if ( nargin <= 3 )
        x0 = zeros(n, 1);
    end
    if ( nargin <= 4 )
        maxit = 100 * n * ( -log(tol) );
    end 
    
    x = x0;
    
    for i = 1 : maxit
        
        r = A * x - b;
        nr = norm( r );
        if ( nr <= tol ), break, end
        
        r = r./D;
        x = x - r;

    end
    
    if ( nr > tol ), warning('maxit broken'), end
    
end
