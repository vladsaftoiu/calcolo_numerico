function [ y ] = newton_interpolation( xi, fi, x)
%NEWTON calcola il polinomio interpolante di grado n in forma di newton
%   xi: vettore delle ascisse
%   fi: vettore delle ordinate
%   x:  vettore dei punti dove calcolare il valore del poli interpolante

    n = length(xi)-1; % grado del polinomio interpolante

    %calcolo le differenze divise
    for i = 1 : n+1
        for j = n+1 : -1 : i+1
            fi(j) = ( fi(j) - fi(j-1) ) / ( xi(j) - xi(j-i) );
        end
    end
    
    y = fi(n+1) * ones(size(x));
    for l = n+1 : -1 : 1
        y = y.*( x - xi(l) ) + fi(l);
    end

end

