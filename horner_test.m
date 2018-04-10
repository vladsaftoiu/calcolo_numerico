function h = horner_test()
% test with:
% 	constant value
% 	simple line function
% 	parabole

	abscissas = linspace(-10, 10, 50);
	
	function_values = arrayfun(@(x) 3*x, abscissas);
	horner_values = arrayfun(@(x) horner([0, 3], x), abscissas);
    sprintf('testing 3x function: %d', sum(function_values - horner_values))
	
	function_values = arrayfun(@(x) 2*x + x^2, abscissas);
	horner_values = arrayfun(@(x) horner([0, 2, 1], x), abscissas);
    sprintf('testing 2x + x^2 function: %d', sum(function_values - horner_values))
	
	function_values = arrayfun(@(x) 2*x + x^2 -4*x^3, abscissas);
	horner_values = arrayfun(@(x) horner([0, 2, 1, -4], x), abscissas);
    sprintf('testing 2x + x^2 -4x^3 function: %d', sum(function_values - horner_values))
	
end