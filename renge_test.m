function en = renge_test( ns )
	en = arrayfun(@(x) inner_renge_test(x), ns)
end

function ien = inner_renge_test( n )

	abscissas = generate_abscissas(-5, 5, n);

	fx = arrayfun(@(x) 1/(1+x^2), abscissas);
	fd = finite_difference(abscissas, fx);
	px = arrayfun(@(x) horner_general(fd, x, abscissas), abscissas);
    ien = max(abs(px - fx));
end