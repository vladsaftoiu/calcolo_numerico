clear;

ns = [ 1 : 10 ]'*100;
iterations = zeros(10,1);
eigenvalues = zeros(10, 1);

for n = 1 :10

    [ l, i ] = power_method( sparse_diags( n*100 ), 10e-5 );
    iterations(n) = i;
    eigenvalues(n) = l;
end

table( ns, iterations, eigenvalues )