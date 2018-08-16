
f = @(x) x^3 - 4*x^2 + 5*x - 2;
f1 = @(x) 3*x^2 - 8*x + 5;
x0 = 0;

methods = {'tolx'; 'newton'; 'newton mod.'; 'aitken'};
tolx = zeros(20,1);
newton_data = zeros(20,1);
newton_mod_data = zeros(20,1);
aitken_data = zeros(20,1);

for i=1 : 20
	
    tolx(i) = 10^-i;
    
    [~, evals] = newton( x0, f, f1, 10^-i, 1000);
    newton_data(i) = evals;
    
    [~, evals] = newton( x0, f, f1, 10^-i, 1000, 2);
    newton_mod_data(i) = evals;
    
    [x, evals] = aitken( x0, f, f1, 10^-i, 1000);
    aitken_data(i) = evals;
end

t = table(tolx, newton_data, newton_mod_data, aitken_data);
t.nit = (t.newton_data-2)./2;
t.nmit = (t.newton_mod_data-2)./2;
t.ait = t.aitken_data./4