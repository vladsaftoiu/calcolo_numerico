function en = renge_test( n )

	abscissas = generate_abscissas(-5, 5, n);

	fx = arrayfun(@(x) 1/(1+x^2), abscissas);
	fd = finite_difference(abscissas, fx);
	px = arrayfun(@(x) horner_general(fd, x, abscissas), abscissas);
    en = max(abs(px - fx))
end