function [ y ] = hermite( xi, fi, f1i, x )
%[ y ] = HERMITE( xi, fi, f1i, x ) 
% calculates the Hermite polinomial that interpolate f in xi
%   xi: interpolation nodes vector
%   fi: function values vector
%   f1i: first derivative of function vector
%   x: vector of points which are to be evaluated
    
    n = length(xi) -1; 
      
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
    for l = n : -1 : 1
        y = y.*(x-xh(l)) + hfd(l);
    end
end

function [ hfd ] = hermite_finite_differences( xi, fi, n )

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