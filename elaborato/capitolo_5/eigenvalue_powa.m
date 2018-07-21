function [l1] = eigenvalue_powa( A )
    n = length(A);
    x = rand(n, 1);
    l1 = Inf;
    itmax = 10^5;
    tol = 1/itmax;
    for k=1 : itmax
        l0 = l1;
        z = A*x;
        l1 = x.'*z;
        if (abs(l1-l0)<tol) 
            break; 
        end
        x = z/norm(z);
    end
end