function xs = generate_abscissas(a, b, n)
	xs = [];
	step = (b-a)/n;

	for i=1 : 1 : n
		xs(i) = a + step*i;
	end
end