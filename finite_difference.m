function fd = finite_difference( x, f )
% FINITE_DIFFERENCE 
% 	Calculates the finite difference of a function F over an input
% 	vector X; in order to correctly work:
% 		* X and F must have same size;
% 		* elements of X must be different;

    x = sort(x);

    if (length(x) ~= length(f))
        error('input vectors must be same size')
    end
    if (~are_distinct(x))
        error('input abscissas must be distinct')
    end 

    fd = f;
    n = length(x);

    for j = 1 : n
        for i = n : -1 : j+1
            fd(i) = (fd(i) - fd(i-1)) / (x(i) - (x(i-j)));
        end
    end
end

function y = are_distinct( xs )
    y = true;
    for i = 1 : 1 : length(xs)-1
        y = xs(i)-xs(i+1) ~= 0;
    end
end