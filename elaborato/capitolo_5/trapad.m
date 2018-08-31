function [ I ] = trapad( fun, a, b, tol, fa, fb )
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
    end
    
    fc = feval( fun, c );
    h = ( b - a ) / 2;
    
    I_one = h * ( fa + fb );        
    I = h/2 * ( fa + 2*fc + fb );   
    err = abs( I - I_one ) / 3;      
    
    if ( err > tol )
        I = trapad( fun,  a, c, tol/2, fa, fc) + trapad( fun, c, b, tol/2, fc, fb );
    end
end