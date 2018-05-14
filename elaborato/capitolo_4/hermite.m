function [y] = hermite( xi, fi, f1i, x )
%HERMITE calcola il polinomio interpolante in forma di Hermite
%   xi: vettore delle ascisse
%   fi: vettore delle ordinate
%   f1i: vettore delle derivate prime
%   x: vettore dei punti dove calcolare il poli interpolante
    
    n = length(xi) -1; % grado del polinomio interpolante
    
    % check that arrays are same size
    
    fh = zeros(1, 2*n+2); %one by one merge of fi and f1i
    xh = zeros(1, 2*n+2); %double the abscisssas
    for i = 2 : 2 : 2*n+2
            fh(i-1)=fi(i/2);
            fh(i)=f1i(i/2);
            
            xh(i-1) = xi(i/2);
            xh(i) = xi(i/2);
    end
    hfd = hermite_finite_differences( xh, fh, n );
    
    %horner general
    y = hfd(n+1) * ones(size(x));
    for l = n+1 : -1 : 1
        y = y.*(x-xh(l)) + hfd(l);
    end
end

function [hfd] = hermite_finite_differences( xi, fi, n )

    for i= (2*n+1): -2 : 3
        fi(i) = ( fi(i) - fi(i-2) ) / ( xi(i) - xi(i-2) );
    end
    for i = 2: 2*n
        for j = (2*n+2) : -1 : i+1
            fi(j) = ( fi(j) - fi(j-1) ) / ( xi(j) - xi(j-i) );
        end
    end

    hfd = fi;
end