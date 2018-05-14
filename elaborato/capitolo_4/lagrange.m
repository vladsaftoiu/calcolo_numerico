function [y] = lagrange( xi, fi, x )
%LAGRANGE calcola il polinomio interpolante in forma di Lagrange
%   xi: vettore delle ascisse
%   fi: vettore delle ordinate
%   x: punto da calcolare  
    
    y = zeros(1, length(x));
    
    for k = 1 : length(x)
        l = lagrange_c( xi,  x(k));
        y(k) = sum(fi.*l);
    end
end

function [y] = lagrange_c( xi, x )
%LAGRANGE_C calcola i coefficienti Lkn di lagrange
%   xi: vettore delle ascisse
%   x: punto da calcolare

    n = length(xi);
    y = ones(1, n);
    for k = 1 : n
        for j = 1 : n
            if (k~=j) 
               y(k) = y(k) * (x-xi(j))/( xi(k)-xi(j) );
            end
        end
    end
end

