function [ fd ] = finite_difference( x, f )
% [ fd ] = FINITE_DIFFERENCE ( X, F )
% 	Calculates the finite difference of a function F over an input
% 	vector X; in order to correctly work:
% 		* X and F must have same size;
% 		* elements of X must be different;

    % guard: vectors have same size
    if (length(x) ~= length(f)), throw(MException('lol')), end

    fd = 0;
    n = length(x);

    for i = 1 : n
        p = 1;
        for j = 1 : n
            if (j == i), continue, end
            p = p * ( x(i) - x(j) );
        end
        fd = fd + f(i)/p;
    end
end
