function [ If ] = simpcomp( n, a, b, fun )
%[ If ] = SIMPCOMP( n, a, b, fun ) 
% calculates the integratl between a and b for the function f
% Simpson's composite method for n subintervals is used 
%   n: number of intervals of the partition
%   a: left-hand interval boundary 
%   b: right-hand interval boundary
%   fun: function whose integral is to be calculated

    m = 2*n;
    x = linspace(a,b,m+1);
    f = feval(fun, x);
    
    If = (b-a)/(3*m) * (4*sum(f(2:2:m+1)) +2*sum(f(1:2:m+1)) - f(1) - f(end));
end