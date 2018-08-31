function [ I, fevals ] = simpad( fun, a, b, tol, fa, fb, fc, fevals )
%TRAPAD( fun, a, b, tol ) 
% calcola l'integrale tra a e b della function fun passata come parametro
% usando il metodo di Simpson adattivo
%   a: estremo destro intervallo 
%   b: estremo sinistro intervallo
%   fun: funzione di cui approssimare l'integrale
%   tol: tolleranza per il criterio di arresto

    c = ( a + b ) / 2;
    
    if (nargin <= 4)
       fa = feval( fun, a ); 
       fb = feval( fun, b ); 
       fc = feval( fun, c );
       fevals = 5;
    end
        
    x1 = ( a + c ) / 2;
    x2 = ( c + b ) / 2;
    f1 = feval( fun, x1 );
    f2 = feval( fun, x2 );
    
    h = ( b - a ) / 6;
    
    I_one = h * ( fa + 4*fc + fb );        
    I = h/2 * ( fa + 4*f1 + 2*fc +4*f2 + fb );   
    
    err = abs( I - I_one ) / 15;      
    
    if ( err > tol )
        [left, p] = simpad( fun,  a, c, tol/2, fa, fc, f1, 2 );
        [right, q] = simpad( fun, c, b, tol/2, fc, fb, f2, 2 );
        
        I = left + right;
        fevals = fevals + p + q;
    end
end