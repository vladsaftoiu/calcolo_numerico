function [ A ] = LU( A )
% [ A ] = LU( A )
% performs, if possible, a A = L x U factorization of A. A is rewritten 
% with the significative part of L and the U part
%   A: input matrix

    n = length(A); % dimensione matrice
   
    for i = 1 : n-1
        if A(i,i)==0
            error('la mtraice non è fattorizzabile LU')
        end
        
        A(i+1:n,i) = A(i+1:n,i)/A(i,i);
        A(i+1:n,i+1:n) = A(i+1:n,i+1:n) -A(i+1:n,i)*A(i,i+1:n);
    end
end