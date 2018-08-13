
f = @(x) x^3 - 4*x^2 + 5*x - 2;
f1 = @(x) 3*x^2 - 8*x + 5;
x0 = 0;


for i=1 : 10
	[x, evals] = newton( x0, f, f1, 10^-i, 1000, 2)
end