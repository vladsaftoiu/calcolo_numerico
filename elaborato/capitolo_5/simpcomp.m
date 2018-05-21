function [If] = simpcomp( n, a, b, fun )
%SIMPCOMP( n, a, b, fun ) 
% calcola l'integrale tra a e b della function fun passata come parametro
% usando il metodo di simpson
%   n: numero di intervalli equidistanti della partizione
%   a: estremo destro intervallo 
%   b: estremo sinistro intervallo
%   fun: funzione di cui approssimare l'integrale

    m = 2*n;
    x = linspace(a,b,m+1); %vettore delle ascisse equidistanti
    f = feval(fun, x);
    
    If = (b-a)/(3*m) * (4*sum(f(2:2:m+1)) +2*sum(f(1:2:m+1)) - f(1) - f(end));
end