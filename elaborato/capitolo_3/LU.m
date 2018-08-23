function [ A ] = LU( A )
%LU determina, se possibile, la fattorizzazione LU della matrice A in
%ingresso
%   A: matrice da fattorizzare

    n = length(A); % dimensione matrice
   
    for i = 1 : n-1
        if A(i,i)==0
            error('la mtraice non è fattorizzabile LU')
        end
        
        A(i+1:n,i) = A(i+1:n,i)/A(i,i);
        A(i+1:n,i+1:n) = A(i+1:n,i+1:n) -A(i+1:n,i)*A(i,i+1:n);
    end
end