function [ x ] = secanti_sqrt( alpha, x0, x1, tolx, itmax )

    x(1) = x0;
    x(2) = x1;
    i = 2;
   
    while( i < itmax ) && ( abs( x(i) - x(i-1) ) > tolx )    
        i = i+1;
        x(i) = ( x(i-1)*x(i-2) + alpha ) / ( x(i-1) + x(i-2) );
    end
    
    if ( abs( x(end) - x(end-1) ) > tolx ), disp('il metodo non converge'), end
end