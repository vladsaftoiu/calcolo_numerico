function y = horner( a, x )
% evaluates the polinomia y over the coefficients given by vector a
% in a specifica abscissa x

	n = length(a)-1;
	y = a(n);
	
	for i = n : -1 : 1
		y = y.*x + a(i);
	end
end