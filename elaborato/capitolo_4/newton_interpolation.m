function [ y ] = newton_interpolation( xi, fi, x)
%[ y ] = NEWTON_INTERPOLATION( xi, fi, x ) calcola il polinomio interpolante di grado n in forma di newton
% calculates the polinomial that interpolate f in xi in the Newton form
%   xi: interpolation nodes vector
%   fi: function values vector
%   x: vector of points which are to be evaluated

    n = length(xi)-1;

    %finite differences
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

