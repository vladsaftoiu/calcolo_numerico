function [ I, fevals ] = trapad( fun, a, b, tol, fa, fb, fevals )
%TRAPAD( fun, a, b, tol ) 
% calcola l'integrale tra a e b della function fun passata come parametro
% usando il metodo dei trapezi adattivo
%   a: estremo destro intervallo 
%   b: estremo sinistro intervallo
%   fun: funzione di cui approssimare l'integrale
%   tol: tolleranza per il criterio di arresto

    c = ( a + b ) / 2;
    
    if (nargin <= 4)
       fa = feval( fun, a ); 
       fb = feval( fun, b ); 
       fevals = 3;
    end
    
    fc = feval( fun, c );
        
    h = ( b - a ) / 2;
    
    I_one = h * ( fa + fb );        
    I = h/2 * ( fa + 2*fc + fb );   
    err = abs( I - I_one ) / 3;      
    
    if ( err > tol )
        [ left, p ] = trapad( fun,  a, c, tol/2, fa, fc, 1 );
        [ right, q ] = trapad( fun, c, b, tol/2, fc, fb, 1 );
        
        I = left + right;
        fevals = fevals + p + q;
    end
    
  end