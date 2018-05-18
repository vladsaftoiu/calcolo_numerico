function [If] = trapcomp( n, a, b, fun )
%TRAPCOMP( n, a, b, fun ) 
% calcola l'integrale tra a e b della function fun passata come parametro
%   n: numero di intervalli equidistanti della partizione
%   a: estremo destro intervallo 
%   b: estremo sinistro intervallo
%   fun: funzione di cui approssimare l'integrale

    x = linspace(a,b,n+1); %vettore delle ascisse equidistanti
    f = feval(fun, x);
    
    If = (b-a)/n * (sum(f) -0.5*(f(1)+f(end)));
end