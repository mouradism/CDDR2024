function isCollision = collision(pointX, pointY)
    % COLLISION Checks if a point collides with any circular obstacles.
    %   Inputs:
    %       pointX - X-coordinate of the point to be checked.
    %       pointY - Y-coordinate of the point to be checked.
    %   Output:
    %       isCollision - Returns true if the point is within or on the 
    %       boundary of any obstacle, otherwise false.
    
    % Define point coordinates
    xCoordinate = pointX;
    yCoordinate = pointY;
    
    % Define obstacle 1 parameters
    obstacle1CenterX = 0.3;  % X-coordinate of obstacle 1's center
    obstacle1Radius = 0.2;   % Radius of obstacle 1
    obstacle1CenterY = 0;    % Y-coordinate of obstacle 1's center

    % Define obstacle 2 parameters
    obstacle2CenterX = 0;    % X-coordinate of obstacle 2's center
    obstacle2Radius = 0.2;   % Radius of obstacle 2
    obstacle2CenterY = -0.2; % Y-coordinate of obstacle 2's center

    % Calculate distance from the point to each obstacle center
    distanceToObstacle1 = sqrt((xCoordinate - obstacle1CenterX)^2 + (yCoordinate - obstacle1CenterY)^2);
    distanceToObstacle2 = sqrt((xCoordinate - obstacle2CenterX)^2 + (yCoordinate - obstacle2CenterY)^2);

    % Check if the point is outside both obstacles
    if (distanceToObstacle1 > obstacle1Radius && distanceToObstacle2 > obstacle2Radius)
        isCollision = false; % Point is outside both obstacles
    else
        isCollision = true;  % Point is inside or on the edge of at least one obstacle
    end
end
