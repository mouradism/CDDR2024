function inWorkspace = isInWorkspace(pos, Xmin, Xmax, Ymin, Ymax)
    % isInWorkspace - Checks if the position is within the workspace
    % Inputs:
    %   pos  - Position [x, y]
    %   Xmin - Minimum x bound
    %   Xmax - Maximum x bound
    %   Ymin - Minimum y bound
    %   Ymax - Maximum y bound
    % Outputs:
    %   inWorkspace - Boolean indicating if the position is in the workspace
    if abs(pos(1)) > abs(Xmax) || abs(pos(2)) > abs(Ymax)
        disp('Position is not in the workspace');
        disp('Max admissible coordinates [X, Y, Z] = [+0.35, +0.55, 0]');
        disp('Min admissible coordinates [X, Y, Z] = [-0.35, -0.55, 0]');
        inWorkspace = false;
    else
        inWorkspace = true;
    end
end
