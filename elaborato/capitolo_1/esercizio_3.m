do()

function [] = do( )
    for j=1:10
        h = 10^-j;
        phi(@(x) x^4, h, 1)
    end
end

function [y] = phi(f, h, x)
    y = (feval( f, x+h ) - feval( f, x-h )) / ( 2*h );
end