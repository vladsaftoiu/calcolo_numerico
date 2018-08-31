clear;
hold on;
syms x;

f = 1/( 1+x^2 );
fh = matlabFunction(f);

a = -6;
b = 6;
xs = a : .2 : b; % evaluating points

for n = 2 : 2 : 12
    
    step = ( b - a ) / n;
    xi = a : step : b;
    fi = arrayfun( fh, xi' );
    
    y = lagrange( xi, fi, xs );
    plot( xs, y )
    
end