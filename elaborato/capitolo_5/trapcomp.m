function [ If ] = trapcomp( n, a, b, fun )
%[ If ] = TRAPCOMP( n, a, b, fun ) 
% calculates the integral between a and b for the function f;
% trapezoidal method is used
%   n: number of sub intervals for the partition
%   a: left-hand interval boundary 
%   b: right-hand interval boundary
%   fun: function whose integral is to be calculated
%   tol: tolerance used for break condition

    x = linspace(a,b,n+1); 
    f = feval(fun, x);
    
    If = (b-a)/n * (sum(f) -0.5*(f(1)+f(end)));
end