function [ xi ] = chebyshev_abscissas( n, a, b )
    
    xi = zeros(n+1, 1);
    middle = (a + b) / 2;   
    half = (b - a) / 2;
    
    for i = 0 : n
        xi(n+1-i) = middle + cos(pi * (2*i+1) / (2 * (n+1))) * half;
    end
end
