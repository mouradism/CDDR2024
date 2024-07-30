function path = pathPlanning(posi, posf, mapS, Xpas, Ypas, tol)
    % pathPlanning - Performs path planning using BFS and DFS
    % Inputs:
    %   posi - Initial position [x, y]
    %   posf - Final position [x, y]
    %   mapS - Map matrix
    %   Xpas - Step size in x direction
    %   Ypas - Step size in y direction
    %   tol  - Tolerance for reaching the goal
    % Outputs:
    %   path - Planned path

    % Initialize path variables
    fatt = posi; % Queue for BFS/DFS
    posa = posi; % Current position
    path = posi; % Resulting path
    nfini = true; % Continue flag

    while nfini
        % Mark current position as processed
        xS = int16((posa(1) + 0.35) / Xpas) + 1;
        yS = int16((posa(2) + 0.55) / Ypas) + 1;
        mapS(xS, yS) = 3; % Processed

        % Remove head from queue
        if size(fatt, 1) > 1
            fatt(1, :) = []; % Dequeue
        end

        % Get neighbors
        xmi = max(posa(1) - Xpas, -0.35);
        xma = min(posa(1) + Xpas, 0.35);
        ymi = max(posa(2) - Ypas, -0.55);
        yma = min(posa(2) + Ypas, 0.55);

        iniv = true;
        for x = xmi:Xpas:xma
            for y = ymi:Ypas:yma
                % Check if neighbor is valid and closer to the goal
                if iniv && mapS(int16((x + 0.35) / Xpas) + 1, int16((y + 0.55) / Ypas) + 1) == 0
                    posv = [x, y];
                    cosv = norm(posv - posf);
                    iniv = false;
                else
                    costmp = norm([x, y] - posf);
                    if costmp < cosv && mapS(int16((x + 0.35) / Xpas) + 1, int16((y + 0.55) / Ypas) + 1) == 0
                        cosv = costmp;
                        posv = [x, y];
                    end
                end
            end
        end

        % Check if the goal is reached
        if norm(posv - posf) < tol
            nfini = false;
            path = [path; posf];
            break;
        end

        % Collision check and queue update
        if collision(posv(1), posv(2))
            mapS(int16((posv(1) + 0.35) / Xpas) + 1, int16((posv(2) + 0.55) / Ypas) + 1) = 1;
            fatt = [fatt; posv];
        else
            fatt = [posv; fatt];
        end

        % Update current position
        if ~isempty(fatt)
            posa = fatt(1, :);
            path = [path; posa];
        else
            nfini = false;
        end
    end
end
