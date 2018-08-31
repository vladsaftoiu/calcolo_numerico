clear;

f = @(x) exp(-10^6*x);
I = integral( f, 0, 1 );

I_trapad = trapad( f, 0, 1, 10e-9 );
%I_simpad = simpad( );
I_simpcomp = simpcomp( 10e5, 0, 1, f );
I_trapcomp = trapcomp( 10e6, 0, 1, f );

abs ( I - I_simpcomp )
abs ( I - I_trapcomp )
