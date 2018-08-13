function [ x, evals ] = newton( x0, f, f1, tolx, itmax, m )
    
    if nargin <=5, m=1; , end
    
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
    
    evals = 2 +2 * i;
    
    if (abs(x-x) > tolx), disp('il metodo non converge'), end
end