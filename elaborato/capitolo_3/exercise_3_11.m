clear;
format long;

syms x1;
syms x2;
refs = sym('x', [2 1]);

x = [ 1/12 ; 1/6 ];
F = [ 2*x1-x2 ; 3*x2^2-x1];

%test F(x) = 0  --> stationary point
double( subs( F, refs, x ) )

x0 = [ 1/2 ; 1/2 ];

[ t3_incr, t3_err ] = newton_nonlinear_plot( F, x0, 1e3, 1e-3, x );
[ t6_incr, t6_err ] = newton_nonlinear_plot( F, x0, 1e3, 1e-6, x );

table( (1:length(t3_incr))', t3_incr', t3_err' )
table( (1:length(t6_incr))', t6_incr', t6_err' )
