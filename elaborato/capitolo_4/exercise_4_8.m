clear;
leb_fun = @(n) 2/pi*log(n);

ns = 2:2:40;
leb_data = arrayfun(leb_fun, ns);

table( ns', leb_data', growth(leb_data)' )

function [ x ] = growth( x )
% rewrites the input vector as the percentage of growth of n+1 vs n

    for i = length(x) : -1 : 2
       x(i) = ( ( x(i) / x(i-1) ) - 1 ) * 100;
    end
    
    x(1) = 100;
end

