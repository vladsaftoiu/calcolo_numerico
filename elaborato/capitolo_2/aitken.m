function [ x, evals ] = aitken( x0, f, f1, tolx, itmax )
% [ X, EVALS ] = aitken( x0, f, f1, tolx, itmax )
% implements Aitken's method for root search, X is the found root, EVALS is
% the number of iterations that was required to find X 
%   x0: starting point
%   f: function which roots we are looking for
%   f1: first derivative of f
%   tolx: tolerance applied to break condition
%   itmax: maximum number of iterations allowed

    x = x0;
    i = 0;
    proceed = true;
    
    while proceed && ( i < itmax )
        i = i+1;
        x0 = x;
        fx = feval( f, x0 );
        f1x = feval( f1, x0 );
        x1 = x0 - fx/f1x;
        fx = feval( f, x1 );
        f1x = feval( f1, x1 );
        x = x1 - fx/f1x;
        x = ( x*x0 - x1^2 )/( x - 2*x1 + x0 );
        proceed = abs( x - x0 ) > tolx;
    end
    
    evals = 4 * i;
    
    if ( proceed ) , disp( 'il metodo non converge' ), end
end