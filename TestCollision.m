%Explanation of the Unit Test
%Test Case 1 (testNoCollision): Tests a point outside both obstacles.
%Expected output: false.
%Test Case 2 (testCollisionWithObstacle1): Tests a point inside the first obstacle.
%Expected output: true.
%Test Case 3 (testCollisionWithObstacle2): Tests a point inside the second obstacle.
%Expected output: true.
%Test Case 4 (testOnEdgeOfObstacle1): Tests a point exactly on the edge of the first obstacle.
%Expected output: true.
%Test Case 5 (testOnEdgeOfObstacle2): Tests a point exactly on the edge of the second obstacle.
%Expected output: true.
%Test Case 6 (testInsideBothObstacles): Tests a point inside both obstacles.
%Expected output: true.
%Test Case 7 (testOnEdgeOfBothObstacles): Tests a point on the edge of both obstacles.
%Expected output: true.
%Test Case 8 (testOutsideBothObstacles): Tests a point outside both obstacles, farther away.
%Expected output: false.

%Running the Test
%To run the test, you can save the above unit test code in a file named TestCollision.m and run it in MATLAB using the following command:
%results = runtests('TestCollision');
%disp(results);


classdef TestCollision < matlab.unittest.TestCase
    methods (Test)
        function testNoCollision(testCase)
            % Test a point outside both obstacles
            x = 0.6;
            y = 0.6;
            actual = collision(x, y);
            expected = false;
            testCase.verifyEqual(actual, expected);
        end
        
        function testCollisionWithObstacle1(testCase)
            % Test a point inside obstacle 1
            x = 0.3;
            y = 0.1;
            actual = collision(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testCollisionWithObstacle2(testCase)
            % Test a point inside obstacle 2
            x = 0;
            y = -0.3;
            actual = collision(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testOnEdgeOfObstacle1(testCase)
            % Test a point on the edge of obstacle 1
            x = 0.3;
            y = 0.2;
            actual = collision(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testOnEdgeOfObstacle2(testCase)
            % Test a point on the edge of obstacle 2
            x = 0.2;
            y = -0.2;
            actual = collision(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testInsideBothObstacles(testCase)
            % Test a point inside both obstacles
            x = 0.1;
            y = -0.1;
            actual = collision(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testOnEdgeOfBothObstacles(testCase)
            % Test a point on the edge of both obstacles
            x = 0.1;
            y = -0.2;
            actual = collision(x, y);
            expected = true;
            testCase.verifyEqual(actual, expected);
        end
        
        function testOutsideBothObstacles(testCase)
            % Test a point outside both obstacles (closer to one)
            x = -0.3;
            y = -0.3;
            actual = collision(x, y);
            expected = false;
            testCase.verifyEqual(actual, expected);
        end
    end
end
