function [ x, k ] = newton_nonlinear( F, x0, itmax, tol )
% [ X, K ] = NEWTON_NONLINEAR ( F, x0, itmax, tol )  uses iterative linear
% solving to obtain the solution to a non-linear system in te form F(y) = 0
% we also return K as the number of iterations required to find X
%   F:  array of expressions for f(x1, x2, ...)
%   x0:  starting point
%   itmax:  maximum iterations allowed
%   tol:  tolerance used to break loop
   
    k = 0;
    x_last = zeros(length(x0), 1);
    x = x0;
    
    refs = sym('x', [length(x0) 1]);  % array of involved variables
    J = jacobian( F );
    
    while ( k < itmax ) && ( norm(x - x_last) > tol )
        k = k + 1;
        x_last = x;
        
        J_k = double( subs( J, refs, x ) );
        F_k = double( subs( F, refs, x ) );
        d_k = solve_with_lu_pivoting( J_k, -F_k );
        
        x = x + d_k;
    end
    
end