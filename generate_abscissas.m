function xs = generate_abscissas(a, b, n)
	%guard: a < b 
	%guard: n > 0
	xs = [a:(b-a)/n:b]
end