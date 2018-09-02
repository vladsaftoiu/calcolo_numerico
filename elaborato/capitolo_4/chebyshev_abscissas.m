function [ xi ] = chebyshev_abscissas( n, a, b )
%[ xi ] = CHEBYSHEV_ABSCISSAS( n, a, b )
% calculates the abscissas which are roots for the Chebyshev 
% polinomial of the first kind
%   n: grade of the polinomial, also number of roots
%   a: left-hand interval boundary 
%   b: right-hand interval boundary
       
    xi = zeros(n+1, 1);
    middle = (a + b) / 2;   
    half = (b - a) / 2;
    
    for i = 0 : n
        xi(n+1-i) = middle + cos(pi * (2*i+1) / (2 * (n+1))) * half;
    end
end
