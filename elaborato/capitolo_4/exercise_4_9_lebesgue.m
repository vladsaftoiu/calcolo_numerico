clear;
hold on;

step = 2 / 5000;
zs = -1: step :1;   % plenty of evaluation points

for n = 2 : 2 : 12

    xs = -1: 2/n : 1; % equidistant interpolating points
    lf = arrayfun(@(x) lebesgue_function( xs, x ), zs);
    plot(zs, lf);

end

xlabel('points');
ylabel('Lebesgue function');
title('lebesgue constant for n=2,4,6,8,10,12')
legend(string(2 : 2 : 12))

exercise_ns = 2 : 2 :40;
lebesgue_constant_data = arrayfun( @(n) lebesgue_constant( -1: 2/n : 1, zs ), exercise_ns );
table( exercise_ns' , lebesgue_constant_data' )

function [ lc ] = lebesgue_constant( xs, zs )
% xs: interpolation points
% zs: evaluation points
    
    lf = arrayfun(@(x) lebesgue_function( xs, x ), zs);
    lc = norm(lf, Inf);
    
end

function [ lf ] = lebesgue_function( xs, z ) 
%x:  are interpolating nodes
%z:  is the evaluating point

    n = length(xs);
    L = ones(1, n);
    
    for i = 1 : n
        for j = 1 : n
            if j~=i
                L(i) = L(i) * ((z - xs(j)) / (xs(j) - xs(i)));
            end
        end
    end
    
    lf = sum(abs(L));
end