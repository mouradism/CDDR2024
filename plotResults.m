function plotResults(path, Xpas, Ypas, Xmin, Xmax, Ymin, Ymax)
    % plotResults - Plots the planned path
    % Inputs:
    %   path - Path points
    %   Xpas - Step size in x direction
    %   Ypas - Step size in y direction
    %   Xmin - Minimum x bound
    %   Xmax - Maximum x bound
    %   Ymin - Minimum y bound
    %   Ymax - Maximum y bound

    figure;
    hold on;
    axis equal;
    grid on;
    xlim([Xmin, Xmax]);
    ylim([Ymin, Ymax]);

    % Plot workspace boundaries
    rectangle('Position', [Xmin, Ymin, Xmax - Xmin, Ymax - Ymin], 'EdgeColor', 'k');

    % Plot initial and final positions
    plot(path(1, 1), path(1, 2), 'go', 'MarkerSize', 10, 'DisplayName', 'Start');
    plot(path(end, 1), path(end, 2), 'ro', 'MarkerSize', 10, 'DisplayName', 'Goal');

    % Plot path
    plot(path(:, 1), path(:, 2), 'b-', 'LineWidth', 2, 'DisplayName', 'Path');

    legend;
    title('Path Planning Result');
    xlabel('X Position (m)');
    ylabel('Y Position (m)');
end
