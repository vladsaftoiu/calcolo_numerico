function [ l1, k ] = power_method( A, tol )
% [ l1, k ] = POWER_METHOD( A, tol )
% calculate the greatest eigenvalue of matrix A, also return the number of
% iterations required
%   A: is a square matrix 
%   tol: is the tolerance used for break condition

    n = length(A);
    x = rand(n,1);
    l1 = Inf;
    itmax = 1e5;
        
    for k = 1 : itmax
       l0 = l1;
       z = A*x;
       l1 = x'*z;
       if ( abs(l1 - l0) < tol ), break, end
       x = z / norm(z);
    end
    
end