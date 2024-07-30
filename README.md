# CDDR2024
updated version of CDDR2013
Double Pendulum Simulation with CDDR Control
Overview
This project implements a simulation of a double pendulum system with a Centralized Dynamic Decentralized Receding (CDDR) control strategy. The simulation is built using MATLAB and visualizes the dynamics of the double pendulum, along with control mechanisms applied to maintain stability or achieve specific motion objectives.


Table of Contents
Features
Getting Started
Prerequisites
Installation
Usage
Project Structure
Configuration
Troubleshooting
Future Work
Contributing
License
Features
Simulates a double pendulum: Models the complex dynamics of a double pendulum system.
CDDR Control Implementation: Implements a control strategy to stabilize or manipulate pendulum motion.
Customizable Parameters: Allows users to modify pendulum lengths, masses, damping, and other system parameters.
Animation and Visualization: Provides a graphical representation of the pendulum's motion over time.
Movie Recording Option: Option to save simulation as a video file.
Getting Started
Prerequisites
To run this simulation, you need the following:

MATLAB R2023a or later
MATLAB's Simulink and Control System Toolbox (optional, but recommended for more advanced simulations)

Installation
Clone the Repository:
Navigate to the Project Directory:
Usage
To run the simulation and visualize the double pendulum dynamics:

Open the Main Script:

Launch the improved_test.m file in MATLAB's editor.
Set Simulation Parameters:

You can adjust the simulation parameters in the script, such as pendulum lengths, masses, and control gains, to experiment with different dynamics.
Run the Simulation:

View the Animation:

The simulation will display an animated plot of the double pendulum motion. If movie is set to true, it will also record and save the animation as a video file (doublePendulumAnimation.avi).
Simulation Parameters
Here are some key parameters you can modify in the improved_test.m file:

Pendulum Parameters:
l1 = 0.622;   % Length of the first pendulum (m)
l2 = 0.622;   % Length of the second pendulum (m)
m1 = 1.35;    % Mass of the first pendulum (kg)
m2 = 1.35;    % Mass of the second pendulum (kg)

Control Gains:
duration = 6;  % Total simulation time (seconds)
fps = 60;      % Frames per second for animation
Movie Recording:
movie = true;  % Set to true to save the animation as a video

Future Work
This project lays the groundwork for a detailed exploration of dynamic control systems. Here are some areas for future enhancement:

Advanced Control Techniques:

Implement additional control strategies, such as PID controllers, adaptive control, or machine learning-based approaches.
Physical Realism:

Introduce air resistance and other realistic forces to simulate more authentic pendulum dynamics.
3D Simulation:

Extend the simulation to 3D for a more comprehensive visualization of the pendulum's motion.
User Interface:

Develop a GUI to allow users to adjust parameters interactively without modifying the script directly.
Educational Modules:

Include explanations and demonstrations of key concepts in control theory and dynamics for educational purposes.
Contributing
Contributions to the project are welcome! If you'd like to contribute, please follow these guidelines:

Fork the Repository:

Create a personal copy of the project repository by forking it on GitHub.
Create a New Branch:

Use descriptive names for branches, such as feature-new-control-method or bugfix-plotting-issue.
Make Your Changes:

Implement your changes or improvements. Ensure your code follows the project's coding style and conventions.
Test Thoroughly:

Run tests to ensure your changes don't introduce new bugs or issues.
Submit a Pull Request:

Once your changes are ready, submit a pull request to the main repository. Include a clear description of your changes and the problem or feature they address.
License
This project is licensed under the MIT License - see the LICENSE file for details.



