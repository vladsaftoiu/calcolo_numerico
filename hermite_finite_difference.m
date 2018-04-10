function [f] = hermite_finite_difference( x, f )
%HERMITE_FINITE_DIFFERENCE Summary of this function goes here
%   Detailed explanation goes here

for i = (2*n+1):-2:3
    f(i) = ( f(i) - f(i-2) ) / ( x(i) - x(i-2) );
end
for i = 2:2*n
    for j = (2*n+2): -1 : i+1
        f(j) = ( f(j) - f(j-1) ) / ( x(j) - x(j-i) );
    end
end

end

