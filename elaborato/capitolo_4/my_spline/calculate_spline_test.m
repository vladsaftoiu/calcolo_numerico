clear;
a = -6;
b = 6;
hold on;
x = a:.02:b;
step = (b-a)/18;
xi = a:step:b;
fi = arrayfun( @(y) 1/(1+y^2), xi );
plot(x, spline3( xi, fi, x, true ));


% for n = 6 : 2 : 18
%     step = (b-a)/n;
%     xi = a:step:b;
%     fi = arrayfun( @(y) 1/(1+y^2), xi );
%     y = calculate_spline( xi, fi,  0 );
%     plot(x, y );
% end

% natural splines, plot representation
%for n = 6 : 2 : 18
%    step = (b-a)/n;
%    xi = a:step:b;
%    fi = arrayfun( @(y) 1/(1+y^2), xi );
%    funs = spline3( xi, fi,  false );
%    for i = 1 : length(funs)
%        fplot( matlabFunction(funs(i)), [xi(i) xi(i+1)] );
%    end
%end