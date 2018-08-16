
alpha = 5;
x0 = 5;
tolx = 10^-20;
itmax = 10^3;
x = newton_sqrt( alpha, x0, tolx, itmax ); 
e = arrayfun( @(z) abs( z - sqrt(alpha) ), x );

% transpose result is for table usage
x = x';
abs_e = e';

t = table( x, abs_e )