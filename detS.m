function res = detS(x, y)
    % detS - Determines a value based on the input `s`
    % Input:
    %   x - Scalar input value
    %   y - Scalar input value (unused in the logic)
    % Output:
    %   res - Resulting value (1 or 2) based on the condition
    
    s = x; % Assume `s` is determined by `x`
    
    % Check the condition
    if (0.15 < s) && (s < 0.2)
        res = 1;
    else
        res = 2;
    end
end
