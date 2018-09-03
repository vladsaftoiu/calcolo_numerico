format long;
[y,r] = do(20);
table(y,r,4-y)

function [y, r] = do( n )
    y = zeros(n,1);
    r = zeros(n,1);
        
    for j=1:n
        h = 10^-j;
        y(j)=phi(@(x) x^4, h, 1);
        r(j)=h^2;
    end
end

function [y] = phi(f, h, x)
    y = (feval( f, x+h ) - feval( f, x-h )) / ( 2*h );
end