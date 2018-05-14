function [y] = hermite( xi, fi, f1i, x )
%HERMITE calcola il polinomio interpolante in forma di Hermite
%   xi: vettore delle ascisse
%   fi: vettore delle ordinate
%   f1i: vettore delle derivate prime
%   x: vettore dei punti dove calcolare il poli interpolante
    
    n = length(xi) -1; % grado del polinomio interpolante
    
    for i= (2*n+1): -2 : 3
        fi(i) = ( fi(i) - fi(i-2) ) / ( x(i) - x(i-2) );
    end
    for i = 2: 2*n
        for j = (2*n+2) : -1 : i+1
            fi(j) = ( fi(j) - fi(j-1) ) / ( x(j) - x(j-i) );
        end
    end
    
    y = fi(n+1) * ones(size(x))
end

