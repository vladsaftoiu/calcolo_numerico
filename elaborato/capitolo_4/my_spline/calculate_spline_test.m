clear;
a = -6;
b = 6;
hold on;
x = a:.02:b;

for n = 6 : 2 : 18
    step = (b-a)/n;
    xi = a:step:b;
    fi = arrayfun( @(y) 1/(1+y^2), xi );
    plot(x, spline3( xi, fi, x, false ));
end