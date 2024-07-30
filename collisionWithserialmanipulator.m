function hasCollision = collisionWithserialmanipulator(pointX, pointY)
    % COLLISIONWITHSERIALMANIPULATOR Checks if a point collides with obstacles
    % considering the path of a serial manipulator.
    %   Inputs:
    %       pointX - X-coordinate of the point to be checked.
    %       pointY - Y-coordinate of the point to be checked.
    %   Output:
    %       hasCollision - Returns true if the point or manipulator's path
    %       collides with any obstacle, otherwise false.

    % Initialize collision flag
    hasCollision = false;

    % Define point coordinates as a vector
    pointPosition = [pointX; pointY];

    % Define obstacle offset
    obstacleOffset = [0; 1.10 / 2];

    %% Serial Manipulator Configuration
    % Arm length and joint offsets
    armLength = 1.108;
    jointOffset1 = 0.622;
    jointOffset2 = 0.622;

    % Calculate intermediate point adjusted for arm length
    adjustedPoint = pointPosition + [0; -armLength / 2];

    % Calculate joint angles using inverse kinematics
    cosPhi2 = (adjustedPoint(1)^2 + adjustedPoint(2)^2 - jointOffset1^2 - jointOffset2^2) / (2 * jointOffset1 * jointOffset2);
    phi2 = atan2(sqrt(1 - cosPhi2^2), cosPhi2);
    phi1 = 2 * pi + atan2(adjustedPoint(2) * (jointOffset1 + jointOffset2 * cosPhi2) - adjustedPoint(1) * jointOffset2 * sin(phi2), ...
                          adjustedPoint(1) * (jointOffset1 + jointOffset2 * cosPhi2) + adjustedPoint(2) * jointOffset2 * sin(phi2));

    % Calculate manipulator's position based on joint angles
    manipulatorPosition = obstacleOffset - [jointOffset1 * cos(phi1); jointOffset1 * sin(phi1)];

    % Buffer to store the points along the manipulator's path
    pathPoints = [obstacleOffset, manipulatorPosition, pointPosition]';

    %% Collision Check with Obstacle 1
    % Set initial flag for processing the path
    processPath = true;

    % Process each segment in the pathPoints buffer
    while processPath
        % Extract current segment start and end
        currentStart = pathPoints(1, :)';
        initialPosition = pathPoints(1, :)';
        goalPosition = pathPoints(2, :)';

        % Set the precision for the path traversal
        precision = 100;
        stepX = -((initialPosition(1) - goalPosition(1)) / precision);
        stepY = -((initialPosition(2) - goalPosition(2)) / precision);
        step = [stepX; stepY];

        % Update the pathPoints buffer
        bufferSize = size(pathPoints);

        % Remove the processed position from the buffer
        if bufferSize(1) > 1
            updatedBuffer = zeros(bufferSize(1) - 1, 2);
            for i = 1:bufferSize(1) - 1
                updatedBuffer(i, 1) = pathPoints(i + 1, 1);
                updatedBuffer(i, 2) = pathPoints(i + 1, 2);
            end
        end

        pathPoints = updatedBuffer;

        % Traverse the segment and check for collisions with obstacles
        for x = initialPosition(1):step(1):goalPosition(1)
            % Obstacle 1 parameters
            obstacle1CenterX = 0.5;
            obstacle1CenterY = 0;
            obstacle1Radius = 0.3;
            % Calculate distance to obstacle 1
            distanceToObstacle1 = sqrt((currentStart(1) - obstacle1CenterX)^2 + (currentStart(2) - obstacle1CenterY)^2);

            % Obstacle 2 parameters
            obstacle2CenterX = 0.2;
            obstacle2CenterY = 0;
            obstacle2Radius = 0.1;
            % Calculate distance to obstacle 2
            distanceToObstacle2 = sqrt((currentStart(1) - obstacle2CenterX)^2 + (currentStart(2) - obstacle2CenterY)^2);

            % Check if within any obstacle's radius
            if distanceToObstacle1 <= obstacle1Radius || distanceToObstacle2 <= obstacle2Radius
                collisionDetected = true;
            else
                collisionDetected = false;
            end

            % Update collision flag if any collision is detected
            hasCollision = hasCollision || collisionDetected;

            % Update current position along the path
            currentStart = currentStart + step;
        end

        % Check if the buffer is empty to terminate the loop
        bufferSize = size(pathPoints);
        if bufferSize(1) == 1
            processPath = false;
        end
    end

    %% Collision Check with Obstacle 2
    % (Same logic applies, if there were more obstacles)

end
