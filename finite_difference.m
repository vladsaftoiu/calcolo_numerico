function [fd] = finite_difference( x, f )
% FINITE_DIFFERENCE 
% 	Calculates the finite difference of a function F over an input
% 	vector X; in order to correctly work:
% 		* X and F must have same size;
% 		* elements of X must be different;

% guard: vectors have same size
if (length(x) ~= length(f))
	throw(MException('lol'))
end
% guard: abscissas are different
% guard: vector x is ordered

fd = f;
n = length(x);

for j = 1 : n
	for i = n : -1 : j+1
		fd(i) = (fd(i) - fd(i-1)) / (x(i) - (x(i-j)));
	end
end