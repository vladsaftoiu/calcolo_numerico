function [y] = horner_general( xx, x, f )
% generalized horner's algorithm evaluating the newton polinomial in a
% given point x

	n = length(f);
	y = linspace(1,1,length(xx))*f(n);
	
	for i = n-1 : -1 : 1
        y = y.*(xx - x(i)) + f(i);
	end
	
end