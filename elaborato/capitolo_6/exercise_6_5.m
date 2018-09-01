clear;

n = 1000;
A = sparse_diags( 1000 );
gauss_nrs = nrs_gauss_seidel( A, ones(n, 1),  10e-5 );
jacobi_nrs = nrs_jacobi( A, ones(n, 1),  10e-5 );

semilogy( gauss_nrs )
semilogy( jacobi_nrs )


function [ nrs ] = nrs_jacobi( A, b, tol )

    n = length(A);
    D = diag(A);
    x0 = zeros(n, 1);
    maxit = 100 * n * ( -log(tol) );
    x = x0;
    
    for i = 1 : maxit
        
        r = A * x - b;
        nr = norm( r );
        nrs(i) = nr;
        
        if ( nr <= tol ), break, end
        
        r = r./D;
        x = x - r;

    end
   
end

function [ nrs ] = nrs_gauss_seidel( A, b, tol )

    n = length(b);
    x0 = zeros(n, 1);
	maxit = 100 * n * (-log(tol));
    x = x0;
    
    for i = 1 : maxit
        
        r =  A * x - b;
        nr = norm( r );
        nrs(i) = nr;
        if ( nr <= tol ), break, end
        r = m_solve( A, r );
        x = x - r;
    
    end
        
end

function [ u ] = m_solve( M, r )
    
    u = r;
    n = length(u);
    
    for i = 1 : n
    
        u(i) = u(i) / M(i,i);
        u(i+1 : n) = u(i+1 : n) + M(i+1 : n, i) * u(i);
    
    end
    
end