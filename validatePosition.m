function validatePosition(pos, label)
    % validatePosition - Checks if the position is in an obstacle
    % Inputs:
    %   pos  - Position [x, y]
    %   label - Position label (Initial or Goal)
    if collision(pos(1), pos(2))
        disp([label, ' position is in an obstacle']);
        return;
    end
end
