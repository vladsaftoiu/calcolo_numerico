function [ x ] = bisection( a, b, f, tolx )
% [ X ] = bisection( a, b, f, tolx )
% implements the bisection method for root search, X is the found root for
% function f
%   a: right-hand interval boundary
%   b: left-hand interval boundary
%   f: function which roots we are looking for
%   tolx: tolerance applied to break condition

    fa = feval( f, a );
    fb = feval( f, b );
    x = (a+b) / 2;
    fx = feval( f, x );
    imax = ceil( log2(b-a) - log2(tolx) );
    
    for i=2:imax
        f1x = abs( (fb-fa)/(b-a) );
        if ( abs(fx) <= tolx*f1x )
            break
        elseif fa*fx<0
            b = x;
            fb = fx;
        else
            a = x;
            fa = fx;
        end
        
        x = (a+b)/2;
        fx = feval(f,x);
    end
end

