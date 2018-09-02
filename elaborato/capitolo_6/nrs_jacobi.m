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