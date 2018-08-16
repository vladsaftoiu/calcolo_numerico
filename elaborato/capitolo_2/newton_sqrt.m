function [ x ] = newton_sqrt( alpha, x0, tolx, itmax )

    x(1) = ( x0 + alpha/x0 )/2;
    i = 1;
   
    while( i < itmax ) && ( abs( x(i) - x(i-1) ) > tolx )    
        i = i+1;
        x(i) = ( x(i-1) + alpha/x(i-1) )/2;
    end
    
    if ( abs( x(end) - x(i-1) ) > tolx ), disp('il metodo non converge'), end
end