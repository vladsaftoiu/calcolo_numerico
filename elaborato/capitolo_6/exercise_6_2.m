clear;

ns = [ 1 : 10 ]'*100;
iterations = zeros(10,1);
eigenvalues = zeros(10, 1);
eigs = zeros(10, 1);

for n = 1 :10
    A = sparse_diags( n*100 );
    [ l, i ] = power_method( A, 1e-5 );
    iterations(n) = i;
    eigenvalues(n) = l;
    
    %since for this matrix eigs are negative, we take min as l_1
    eigs(n) = min(eig(A)); 
end

table( ns, iterations, eigenvalues, eigs, eigenvalues-eigs )