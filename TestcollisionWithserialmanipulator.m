%Explanation of the Unit Tests
%Test Case 1 (testNoCollision):

%Tests a point outside both obstacles and the manipulator path.
%Expected output: false.
%Test Case 2 (testCollisionWithObstacle1):

%Tests a point inside obstacle 1.
%Expected output: true.
%Test Case 3 (testCollisionWithObstacle2):

%Tests a point inside obstacle 2.
%Expected output: true.
%Test Case 4 (testOnEdgeOfObstacle1):

%Tests a point on the edge of obstacle 1.
%Expected output: true.
%Test Case 5 (testOnEdgeOfObstacle2):

%Tests a point on the edge of obstacle 2.
%Expected output: true.
%Test Case 6 (testInsideBothObstacles):

%Tests a point inside both obstacles.
%Expected output: true.
%Test Case 7 (testAlongManipulatorPath):

%Tests a point that lies along the manipulator's path.
%Expected output: true.
%Test Case 8 (testFarAwayFromObstacles):

%Tests a point far away from both obstacles and the manipulator path.
%Expected output: false.
%Running the Tests
%To run these tests, save the unit test code in a file named TestCollisionWithSerialManipulator.m and execute it in MATLAB using:

classdef TestcollisionWithserialmanipulator < matlab.unittest.TestCase
    methods (Test)
        function testNoCollision(testCase)
            % Test a point outside both obstacles and manipulator path
            x = 0.7;
            y = 0.7;
            actual = collisionWithserialmanipulator(x, y);
            expected = false;
            testCase.verifyEqual(actual, expected);
        end
        
        function testCollisionWithObstacle1(testCase)
            % Test a point inside obstacle 1
            x = 0.4;
            y = 0;
            actual = collisionWithserialmanipulator(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testCollisionWithObstacle2(testCase)
            % Test a point inside obstacle 2
            x = 0.2;
            y = 0;
            actual = collisionWithserialmanipulator(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testOnEdgeOfObstacle1(testCase)
            % Test a point on the edge of obstacle 1
            x = 0.8;
            y = 0;
            actual = collisionWithserialmanipulator(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testOnEdgeOfObstacle2(testCase)
            % Test a point on the edge of obstacle 2
            x = 0.3;
            y = 0;
            actual = collisionWithserialmanipulator(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testInsideBothObstacles(testCase)
            % Test a point inside both obstacles
            x = 0.1;
            y = 0;
            actual = collisionWithserialmanipulator(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testAlongManipulatorPath(testCase)
            % Test a point that lies along the manipulator's path
            x = 0;
            y = 0.5;
            actual = collisionWithserialmanipulator(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end

        function testFarAwayFromObstacles(testCase)
            % Test a point far away from both obstacles and manipulator path
            x = 5;
            y = 5;
            actual = collisionWithserialmanipulator(x, y);
            expected = false;
            testCase.verifyEqual(actual, expected);
        end
    end
end
