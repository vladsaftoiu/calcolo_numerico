function [ y ] = lagrange( xi, fi, x )
%[ y ] = LAGRANGE( xi, fi, f1i, x ) 
% calculates the polinomial that interpolate f in xi in the Lagrange form
%   xi: interpolation nodes vector
%   fi: function values vector
%   x: vector of points which are to be evaluated
    
    
    m = length(x);
    y = zeros(m, 1);
    
    for k = 1 : m
        l = lagrange_c( xi,  x(k) );
        y(k) = sum(fi.*l);
    end
end

function [ y ] = lagrange_c( xi, x )
%LAGRANGE_C calcola i coefficienti Lkn di lagrange
%   xi: vettore delle ascisse
%   x: punto in cui calcolare

    n = length(xi);
    y = ones(n, 1);
    for k = 1 : n
        for j = 1 : n
            if (k ~= j) 
               y(k) = y(k) * ( x - xi(j) ) / ( xi(k) - xi(j) );
            end
        end
    end
end

