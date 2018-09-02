function [ x, i ] = gauss_seidel( A, b, tol, x0, maxit )
% [ x, i ] = GAUSS_SEIDEL( A, b, tol, x0, maxit )
% iterative method to find the solution to Ax=b system, with A a square
% M-matrix, also the number of iterations is returned.
%   A: is a square M-matrix 
%   b: is the known values vector
%   tol: is the tolerance used for break condition
%   [x0]: optional, is the starting solution vector
%   [maxit]: optional, is the maximum number of iterations allowed

    n = length(b);
    if ( nargin <= 3 )
        x0 = ones(n, 1);
    end
    if (nargin <= 4)
        maxit = 100 * n * ( -log(tol) );
    end
    x = x0;
    
    for i = 1 : maxit
        
        r =  A * x - b;
        nr = norm( r );
        if ( nr <= tol ), break, end
        r = m_solve( A, r );
        x = x - r;
    
    end
    
    if ( nr > tol )
        warning('maxit broken')
    end
    
end

function [ u ] = m_solve( M, r )
    
    u = r;
    n = length(u);
    
    for i = 1 : n
    
        u(i) = u(i) / M(i,i);
        u(i+1 : n) = u(i+1 : n) - M(i+1 : n, i) * u(i);
    
    end
    
end