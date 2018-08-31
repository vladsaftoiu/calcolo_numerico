clear;

f = @(x) exp(-10^6*x);
I = integral( f, 0, 1 );

[ I_trapad, n ] = trapad( f, 0, 1, 10e-9 );
[ I_simpad, m ] = simpad( f, 0, 1, 10e-9 );

I_simpcomp = simpcomp( 10e5, 0, 1, f );
I_trapcomp = trapcomp( 10e6, 0, 1, f );