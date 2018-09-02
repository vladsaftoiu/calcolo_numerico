clear;
hold on;
syms x;

f = 1/( 1+x^2 );
fh = matlabFunction(f);

a = -6;
b = 6;
xs = a : .2 : b; % "nodes" where I want to calculate the p(x) value

%see cap 4.5 using chebyshev abscissas and error estimate, runge function
%got plenty of derivatives
err_fun = @(n) max(abs(arrayfun(matlabFunction(diff(f, n+1)), xs))) / ( factorial(n+1) * 2^n );

for n = 2 : 2 : 40

    xi = chebyshev_abscissas( n, a, b );
    fi = arrayfun( fh, xi );
    
    y = lagrange( xi, fi, xs );
    plot( xs, y )
    
end


ns = 2:2:40;
xlabel('points');
ylabel('lagrange interpolation poly');
title('lagrange interpolation for n=2,4 ... 40 points');
legend(string(ns));
e_data = arrayfun(err_fun, ns);

table( ns', e_data' )