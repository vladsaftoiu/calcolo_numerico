function [ x ] = solve_with_newton(  )

    t =1;
    runs = [];
    itmax = 20;
    tol = 1e-10;
    
    for alfa = 1:0.1:5
        x = [alfa alfa]';
        k = 0;
            while ( k < itmax )
                xv = x;
                [f] = effe(x);
                [j] = jacob(x);
                x = x-j\f;
                if ( norm(x - xv, 2) < tol*norm(x,2) )
                    break;
                else
                    k = k + 1;
                end
                runs(t) = k;
            end
            t = t+1;
    end
    
end

function [ f ] = effe( x )
    f =[ x(1)^2+x(2)^2-2 ; x(1)-x(2) ]; 
end

function [ j ] = jacob ( x )
    
end