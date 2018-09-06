format long;
[h,y,r] = do(20);
table(h,y,r,4-y)

function [h, y, r] = do( n )
    y = zeros(n,1);
    r = zeros(n,1);
    h = zeros(n,1);
    twice_h = 
    
    for j=1:n
        h(j) = 10^-j;
        y(j)=phi(@(x) x^4, h(j), 1);
        r(j)=h(j)^2;
    end
end

function [y] = phi(f, h, x)
    y = (feval( f, x+h ) - feval( f, x-h )) / ( 2*h );
end