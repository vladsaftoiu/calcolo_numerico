function [ x, evals ] = newton( x0, f, f1, tolx, itmax, m )
% [ X, EVALS ] = newton( x0, f, f1, tolx, itmax, [m] )
% implements Newton's method for root search, 
% X is the found root, EVALS is the number of iterations 
% that was required to find X 
%   x0: starting point
%   f: function which roots we are looking for
%   f1: first derivative of f
%   tolx: tolerance applied to break condition
%   itmax: maximum number of iterations allowed     
%   [m=1]: optional, root multiplicity 

    if nargin <=5, m=1;  end
    
    fx = feval( f, x0 );
    f1x = feval( f1, x0 );
    x = x0 - fx/f1x;
    i = 0;
   
    while( i < itmax ) && ( abs(x-x0) > tolx )
        i = i+1;
        x0 = x;
        fx = feval( f, x0 );
        f1x= feval( f1, x0 );
        x = x0 -m*fx/f1x;
    end
    
    evals = 2 + 2 * i;
    
    if (abs(x-x) > tolx), disp('il metodo non converge'), end
end