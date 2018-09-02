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
        u(i+1 : n) = u(i+1 : n) - M(i+1 : n, i) * u(i);
    
    end
    
end