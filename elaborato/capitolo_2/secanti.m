function [ x, evals ] = secanti( x0, f, f1, tolx, itmax )
% [ X1, EVALS ] = secanti( x0, f, f1, tolx, itmax )
% implements quasi-Newton's method for root search (secants), 
% X is the found root, EVALS is the number of iterations 
% that was required to find X 
%   x0: starting point
%   f: function which roots we are looking for
%   f1: first derivative of f
%   tolx: tolerance applied to break condition
%   itmax: maximum number of iterations allowed     

    fx = feval( f, x0 );
    f1x = feval( f1, x0 );
    x = x0 - fx/f1x;
    i = 0;
   
    while( i < itmax ) && ( abs(x-x0) > tolx )
        i = i+1;
        fx0 = fx;
        fx = feval( f, x );
        x1 = ( fx*x0 - fx0*x ) / ( fx-fx0 );
        x0 = x;
        x = x1;
    end
    
    evals = 2 + i;
    
    if (abs(x-x0) > tolx), disp('il metodo non converge'), end
end