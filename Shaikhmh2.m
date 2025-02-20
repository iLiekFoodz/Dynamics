clc; clear; close all;
%=======================================================
% MATLAB HW #2
% Name: Nouh Shaikh
% Date: 2/19/2025
%=======================================================

figure; % Create a figure to hold all subplots

%% Problem 1: Sliding Crate
subplot(3,2,1); % Assign first subplot

% Given Data for the crate
m = 150 / 32.2;  % Convert weight (lb) to mass (slugs)
g = 32.2;         % Acceleration due to gravity (ft/s^2)
theta = 30;       % Angle of the ramp (degrees)
mu_k = 0.3;       % Coefficient of kinetic friction
s = linspace(0, 50, 100); % Position from 0 to 50 ft

% Calculate Forces
W = m * g; % Weight of the crate
N = W * cosd(theta); % Normal force
F_friction = mu_k * N; % Friction force
F_parallel = W * sind(theta); % Force parallel to ramp
F_net = F_parallel - F_friction; % Net force acting on the crate

a = F_net / m; % Acceleration from Newton’s Second Law

% Velocity Calculation using Kinematic Equation (v^2 = u^2 + 2as)
v = sqrt(2 * a * s);

% Display Answer in Command Window
fprintf('Sliding Crate:\nAcceleration = %.2f ft/s^2\n', a);

% Plot Velocity vs Position
plot(s, v, 'b', 'LineWidth', 2);
xlabel('Position (ft)');
ylabel('Velocity (ft/s)');
title('Sliding Crate: Velocity vs. Position');
grid on;

%% Problem 2: Skateboarding in Half-Pipe
subplot(3,2,3); % Assign second subplot

% Given Data
m = 100;    % Mass of skateboarder (kg)
g = 9.81;   % Gravity (m/s^2)
rho = 3;    % Radius of the half-pipe (m)
P = 5;      % Distance from top to bottom (m)
v0 = 1;     % Initial velocity at θ = 0 (m/s)
theta = linspace(0, pi/3, 100); % Range from 0 to 60 degrees in radians

% Velocity Calculation using Energy Conservation
v = sqrt(v0^2 + 2 * g * (P - rho * cos(theta)));

% Normal Force Calculation using Circular Motion Equation
N = m * (v.^2 / rho + g * cos(theta));

% Display Final Velocity in Command Window
fprintf('Skateboarding:\nFinal Velocity at 60 degrees = %.2f m/s\n', v(end));

% Plot Normal Force vs Angle
plot(rad2deg(theta), N, 'r', 'LineWidth', 2);
xlabel('Angle (degrees)');
ylabel('Normal Force (N)');
title('Skateboarding: Normal Force vs. Angle');
grid on;

%% Problem 3: Bowling Ball Free Fall Forces
subplot(3,2,5); % Assign third subplot

% Given Data
d = 8.5 / 12;   % Convert diameter from inches to feet
A = pi * (d/2)^2; % Cross-sectional area (ft^2)
m = 10 / 32.2;  % Convert weight (lb) to mass (slugs)
g = 32.2;       % Gravity (ft/s^2)
Cd = 0.018;     % Drag coefficient
s = 100;        % Initial height (ft)
v = 0;          % Initial velocity

dt = 0.01;      % Time step for integration
t = 0;          % Initial time

% Initialize Arrays to Store Data for Plotting
time = []; % Time values
drag_force = []; % Drag force values
gravity_force = []; % Gravity force values
position = []; % Position values

% Simulation Loop - Euler Integration
while s > 0
    F_gravity = m * g; % Constant gravitational force
    F_drag = Cd * A * v^2; % Drag force (depends on velocity)
    a = (F_gravity - F_drag) / m; % Net acceleration
    
    % Update velocity and position using Euler integration
    v = v + a * dt;
    s = s - v * dt;
    t = t + dt;
    
    % Store values for plotting
    time = [time, t];
    drag_force = [drag_force, F_drag];
    gravity_force = [gravity_force, F_gravity];
    position = [position, s];
end

% Display Final Velocity and Time in Command Window
fprintf('Bowling Ball:\nFinal Velocity = %.2f ft/s\nTime to Fall = %.2f s\n', v, t);

% Plot Drag Force and Gravity Force over Time
plot(time, drag_force, 'r', 'LineWidth', 2);
hold on;
plot(time, gravity_force, 'b', 'LineWidth', 2);
hold off;
xlabel('Time (s)'); ylabel('Force (lb)');
title('Bowling Ball: Forces vs. Time');
legend('Drag Force', 'Gravity Force');
grid on;

%% Animation with Graph in Same Figure
subplot(3,2,[2,4,6]); % Assign animation subplot
axis([-1 1 0 100]); % Set plot limits
grid on;
xlabel('Position'); ylabel('Height (ft)');
title('Bowling Ball Free Fall Animation');
hold on;

% Animation Loop for Falling Ball
for index = 1:length(position)
    cla; % Clear previous frame
    plot(0, position(index), 'bo', 'MarkerSize', 15, 'MarkerFaceColor', 'b'); % Plot ball
    ylim([0 100]);
    xlim([-1 1]);
    
    % Display Time and Velocity as Text on Plot
    text(-0.8, 90, sprintf('Time: %.2f s', time(index)), 'FontSize', 12);
    text(-0.8, 85, sprintf('Velocity: %.2f ft/s', v), 'FontSize', 12);
    drawnow; % Update plot to create animation effect
end
