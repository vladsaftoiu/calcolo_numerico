function y = horner_general( a, x, xs )
% generalized horner's algorithm evaluating the newton polinomial

	n = length(a);
	y = a(n);
	
	for i = n-1 : -1 : 1
		y = y * (x - xs(i)) + a(i);
	end
	
end