function [] = sin_interpolation( )
    ab = linspace(0, 2*pi, 50);
    %xi = pi*[0, 1, 2];   richiesto ma non efficace?
    xi = linspace(0, 2*pi, 4);
    
    plot(sin(ab), '.k'); %black
    hold on;
    plot(newton(xi, sin(xi), ab), 'r'); %red
    hold on;
    plot(lagrange(xi, sin(xi), ab), 'b'); %blue
    
    %plot(hermite(xi, sin(xi), cos(xi), ab), 'g') %green
    
    legend('sin', 'newton', 'lagrange');
end
