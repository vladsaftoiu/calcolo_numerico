function [] = sin_interpolation( )
    ab = linspace(0, 2*pi, 50)';
    xi = linspace(0, 2*pi, 4)'; %xi = pi*[0, 1, 2]';   %doesn't work?
    plot(xi, sin(xi), 'o', 'MarkerSize', 12, 'MarkerEdgeColor','red', 'MarkerFaceColor',[1 .6 .6]);
    hold on;
    plot(ab, sin(ab), '.k'); %black
    hold on;
    plot(ab, newton_interpolation(xi, sin(xi), ab), 'g' ); %green
    hold on;
    plot(ab, lagrange(xi, sin(xi), ab), 'b' ); %blue
    % check why not working ...
    %plot(ab, hermite(xi, sin(xi), cos(xi), ab), 'm') %magenta
    legend( 'interpolation nodes', 'sin', 'newton', 'lagrange');
end
