function en = renge_test( ns )
	en = arrayfun(@(x) inner_renge_test(x), ns)
end

function ien = inner_renge_test( n )

	xs = generate_abscissas(-5, 5, n);

	fx = arrayfun(@(x) 1/(1+x^2), xs);
	fd = finite_difference(xs, fx);
	px = arrayfun(@(x) horner_general(fd, x, xs), xs);
    ien = max(abs(px - fx));
end