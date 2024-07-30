function performSplineInterpolation(path)
    % performSplineInterpolation - Performs spline interpolation on the path
    % Inputs:
    %   path - Path points

    % Spline interpolation
    values = spcrv(path', 3, 1000);
    values1 = fnplt(cscvn(path'), 1.5);

    % Plot smoothed path
    figure;
    hold on;
    axis equal;
    grid on;

    % Plot original path
    plot(path(:, 1), path(:, 2), 'b-', 'LineWidth', 2, 'DisplayName', 'Original Path');

    % Plot smoothed path
    plot(values1(1, :), values1(2, :), 'r-', 'LineWidth', 1.5, 'DisplayName', 'Smoothed Path');

    legend;
    title('Spline Interpolation Result');
    xlabel('X Position (m)');
    ylabel('Y Position (m)');
end
