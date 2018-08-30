function [ s ] = calculate_spline( x, fi, nak )
    n = length(x);
    
    phi = zeros(n-2, 1);
    xi = zeros(n-2, 1);
    fd = zeros(n-2, 1);
    
    for i = 2 : n-1
        hi = x(i) - x(i-1);
        hi1 = x(i+1) - x(i);
        phi(i-1) = hi / (hi + hi1);
        xi(i-1) = hi1 / (hi + hi1);
        fd(i-1) = finite_difference( x(i-1:i+1), fi(i-1:i+1) );
    end
    
    if nak
        mi = solve_for_not_a_knot(phi, xi, fd);
    else
        mi = solve_for_natural_spline(phi, xi, fd);
    end
    
    s = cubic_spline(x, fi, mi);
end

function [ s ] = cubic_spline( xs, fi, mi )
    n = length(xs);
    s = sym('x', [length(xs)-1 1]);
    syms x;
   
    for i = 2 : n
        hi = xs(i) - xs(i-1);
        ri = fi(i-1) - ( (hi^2) / 6 ) * mi(i-1);
        qi = ( fi(i) - fi(i-1) )/ hi - ( hi/6 )*( mi(i) - mi(i-1) );
        s(i-1) = ( (x - xs(i-1))^3 * mi(i) + (xs(i) - x)^3 * mi(i-1) ) / ( 6*hi ) + qi * ( x - xs(i-1) ) + ri;
    end
end

function [ m ] = solve_for_natural_spline( phi, xi, fd )
    fd = 6*fd;
    n = length(xi) + 1;
    l = zeros(n-2, 1);
    u = zeros(n-1, 1);
    u(1)=2;
    
    % see exercise 4.16 book
    for i = 2 : n-1
        l(i) = phi(i) / u(i-1);
        u(i) = 2 - l(i) * xi(i-1);
    end
    
    y = zeros(n-1, 1);
    y(1) = fd(1);
    
    %solve L*m = fd
    for i = 2 : n-1
        y(i) = fd(i) - l(i) * y(i-1);
    end
    
    m = zeros(n-1, 1);
    m(n-1) = y(n-1) / u(n-1);
    
    for i = n-2 : -1 : 1
        m(i) = ( y(i) - xi(i) * fd(i+1) ) / u(i);
    end
    
    m = [0; m; 0];
end

function [ m ] = solve_for_not_a_knot( phi, xi, fd )
    n = length(xi);
    fd = [ 6 * fd(1); 6 * fd; 6 * fd(length(fd)) ];
        
    u = zeros(n+2, 1);
    u(1) = 1;
    u(2) = 2 - phi(1);
    
    w = zeros(n+1, 1);
    w(1) = 0;
    w(2) = xi(1) - phi(1);
    
    l = zeros(n+1, 1);
    l(1) = phi(1) / u(1);
    l(2) = phi(2) / u(2);
    
    u(3) = 2 - l(2) * w(2);
    
    for i = 4 : n
        w(i-1) = xi(i-2);
        l(i-1) = phi(i-1) / u(i-1);
        u(i) = 2 - l(i-1) * w(i-1);
    end
    
    w(n) = xi(n-1);
    l(n) = ( phi(n) - xi(n) ) / u(n);
    u(n+1) = 2 - xi(n) - l(n-1) * w(n-1);
    w(n+1) = xi(n);
    l(n+1) = 0;
    u(n+2) = 1;
    
    y = zeros(n+2, 1);
    y(1) = fd(1);
    
    for i = 2 : n+2
        y(i) = fd(i) - l(i-1) * y(i-1);
    end
    
    m = zeros(n+2, 1);
    m(n+2) = y(n+2) / u(n+2);
    
    for i = n+1 : -1 : 1
        m(i) = ( y(i) - w(i) * m(i+1) ) / u(i);
    end
    
    m(1) = m(1) - m(2) - m(3);
    m(n+2) = m(n+2) - m(n+1) - m(n);
end