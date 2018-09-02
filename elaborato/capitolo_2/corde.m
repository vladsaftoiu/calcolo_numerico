function [ x1, evals ] = corde( x0, f, f1, tolx, itmax )
% [ X1, EVALS ] = corde( x0, f, f1, tolx, itmax )
% implements quasi-Newton's method for root search (rope method), 
% X is the found root, EVALS is the number of iterations 
% that was required to find X 
%   x0: starting point
%   f: function which roots we are looking for
%   f1: first derivative of f
%   tolx: tolerance applied to break condition
%   itmax: maximum number of iterations allowed     

    f1x0 = feval( f1, x0 );
    i = 0;
    proceed = true;
    
    while proceed && ( i < itmax )
        i = i+1;
        fx = feval( f, x0);
        
        if (f1x0 == 0)
            proceed = false; 
            i = i-1;
            break;
        end
        x1 = x0 - fx/f1x0;
        
        proceed = abs( x1 - x0 ) > tolx;
        x0 = x1;
    end
    
    evals = i + 1;
    
    if (proceed), disp('il metodo non converge'), end
end