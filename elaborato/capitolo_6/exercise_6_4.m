clear;

iterations = zeros(46, 1);

for i = 1 : 46
    n = 100 + (i-1) * 20;
    
    A = sparse_diags( n );
    [ x, its ] = gauss_seidel( A, ones(n, 1),  10e-5 );
    iterations(i) = its;
    
end

plot( [ 100:20:1000 ]', iterations )