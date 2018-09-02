function [ I, fevals ] = trapad( fun, a, b, tol, fa, fb, fevals )
%[ I, fevals ] = TRAPAD( fun, a, b, tol ) 
% calculates the integral between a and b for the function f;
% trapezoidal method is used, also the number of function
% evaluations is returned
%   a: right-hand interval boundary 
%   b: left-hand interval boundary
%   fun: function whose integral is to be calculated
%   tol: tolerance used for break condition

    c = ( a + b ) / 2;
    
    if (nargin <= 4)
       fa = feval( fun, a ); 
       fb = feval( fun, b ); 
       fevals = 3;
    end
    
    fc = feval( fun, c );
        
    h = ( b - a ) / 2;
    
    I_one = h * ( fa + fb );        
    I = h/2 * ( fa + 2*fc + fb );   
    err = abs( I - I_one ) / 3;      
    
    if ( err > tol )
        [ left, p ] = trapad( fun,  a, c, tol/2, fa, fc, 1 );
        [ right, q ] = trapad( fun, c, b, tol/2, fc, fb, 1 );
        
        I = left + right;
        fevals = fevals + p + q;
    end
    
  end