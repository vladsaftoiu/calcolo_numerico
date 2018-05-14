function [y] = horner_general( x, xi, fi )
% generalized horner's algorithm evaluating the newton polinomial in a
% given point x

	n = length(fi);
	y = ones(size(x))*fi(n);
	
	for i = n-1 : -1 : 1
        y = y.*(x - xi(i)) + fi(i);
	end
	
end