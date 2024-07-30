%% Improved Path Planning with Collision Detection

clc;
clear;
close all;

% Define global variables
global Lb La
Lb = 0.7; % Width of the robot in meters (along the x-axis)
La = 1.1; % Height of the robot in meters (along the y-axis)

% Define initial and final positions
Xi = [0.2, 0.4]; % Initial position [x, y]
Xf = [-0.2, -0.4]; % Final position [x, y]

% Display workspace boundaries
disp('Workspace boundaries:');
disp('X: [-0.35, 0.35], Y: [-0.55, 0.55]');

% Validate initial and final positions
validatePosition(Xi, 'Initial');
validatePosition(Xf, 'Goal');

% Precision and step size calculations
precision = 50;
step1 = (abs((Xi(1) - Xf(1)) / precision));
step2 = (abs((Xi(2) - Xf(2)) / precision));

% Ensure equal step sizes
maxStep = max(step1, step2);
Xpas = maxStep;
Ypas = maxStep;

tol = maxStep / 2 - 0.001; % Tolerance for position reaching

% Define workspace limits
Xmin = -Lb / 2;
Xmax = Lb / 2;
Ymin = -La / 2;
Ymax = La / 2;

% Check if initial and final positions are within the workspace
if ~isInWorkspace(Xi, Xmin, Xmax, Ymin, Ymax)
    return;
end
if ~isInWorkspace(Xf, Xmin, Xmax, Ymin, Ymax)
    return;
end

% Determine if the initial and final positions are singular
detSi = detS(Xi(1), Xi(2));
detSf = detS(Xf(1), Xf(2));
signe = detSi / abs(detSi);

% Initialize map and path variables
mapS = zeros(int16((Xmax - Xmin) / Xpas) + 1, int16((Ymax - Ymin) / Ypas) + 1);
path = pathPlanning(Xi, Xf, mapS, Xpas, Ypas, tol);

% Display and plot the results
plotResults(path, Xpas, Ypas, Xmin, Xmax, Ymin, Ymax);

% Perform spline interpolation and plot the final trajectory
% performSplineInterpolation(path);
