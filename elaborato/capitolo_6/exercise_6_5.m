clear;

n = 1000;
A = sparse_diags( 1000 );

goj = false;


gauss_nrs = nrs_gauss_seidel( A, ones(n, 1),  1e-5 );
jacobi_nrs = nrs_jacobi( A, ones(n, 1),  1e-5 );
    
semilogy( gauss_nrs )
hold on
semilogy( jacobi_nrs )    

xlabel('iterations');
ylabel('norm(r)');
title('norm(r) by iteration ')

legend('gauss-seidel', 'jacobi')


