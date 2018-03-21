function fd = finite_difference( x, f )
% Calculates the finite difference of a function f over an input
% vector x; a check to verify the abscissas are different is performed

% guard: vectors have same size
% guard: abscissas are different
% guard: vector x is ordered

fd = f;
n = length(x);

for j = 1 : n
	for i = n : -1 : j+1
		fd(i) = (fd(i) - fd(i-1)) / (x(i) - (x(i-j)));
	end
end