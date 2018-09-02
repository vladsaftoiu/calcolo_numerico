clear;

n = 1000;
A = sparse_diags( 1000 );
gauss_nrs = nrs_gauss_seidel( A, ones(n, 1),  10e-5 );
jacobi_nrs = nrs_jacobi( A, ones(n, 1),  10e-5 );

goj = false;

if (goj) 
    semilogy( gauss_nrs )
    xlabel('iterations');
    ylabel('norm(r)');
    title('norm(r) by iteration for Gauss-Seidel method')
else
    semilogy( jacobi_nrs )    
    xlabel('iterations');
    ylabel('norm(r)');
    title('norm(r) by iteration for Jacobi method')
end


