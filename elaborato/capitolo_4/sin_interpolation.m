function [] = sin_interpolation( )
    ab = linspace(0, 2*pi, 50);
    xi = pi*[0, 1, 2];
    
    plot(newton(xi, sin(xi), ab), 'color', 'r'); %red
    hold on;
    plot(lagrange(xi, sin(xi), ab), 'color', 'b'); %blue
end
