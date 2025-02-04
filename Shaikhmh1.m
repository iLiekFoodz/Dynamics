clc; clear; close all;
%=======================================================
% MATLAB HW #1
% Name: Nouh Shaikh
% Date: 2/3/2025
%=======================================================

% MATLAB Script for Particle Motion and Projectile Motion
% ESC 202 Spring 25

%% Part 1: Position, Velocity, and Acceleration (Deravitives)
t = linspace(0, 10, 100); % Time from 0 to 10 seconds
s = t.^3 - 9*t.^2 + 15*t; % Position equation
v = diff(s) ./ diff(t); % Velocity (Derivative)
a = diff(v) ./ diff(t(1:end-1)); % Acceleration (Derivative)

figure % Creating a window to plot these bad boys
subplot(3,1,1);
plot(t, s, 'b', 'LineWidth', 1.5);
xlabel('Time (s)'); ylabel('Position (ft)'); % Just some more plotting 
title('Position vs. Time');
grid on;

subplot(3,1,2);
plot(t(1:end-1), v, 'r', 'LineWidth', 1.5);
xlabel('Time (s)'); ylabel('Velocity (ft/s)');
title('Velocity vs. Time');
grid on;

subplot(3,1,3);
plot(t(1:end-2), a, 'g', 'LineWidth', 1.5);
xlabel('Time (s)'); ylabel('Acceleration (ft/s^2)');
title('Acceleration vs. Time');
grid on;

%% Part 2: Soccer Ball Trajectory
v0 = 10; % Initial velocity in m/s
theta = 39; % Launch angle in degrees
g = 9.81; % Acceleration due to gravity (m/s^2)

vx = v0 * cosd(theta); % Horizontal velocity component
vy = v0 * sind(theta); % Vertical velocity component

t_flight = 2 * vy / g; % Time of flight
t = linspace(0, t_flight, 100); % Time array

x = vx * t; % Horizontal position
y = vy * t - 0.5 * g * t.^2; % Vertical position

subplot(2,2,1);
plot(x, y, 'b', 'LineWidth', 1.5); % Some more plotting 
xlabel('Distance (m)'); ylabel('Height (m)');
title('Soccer Ball Trajectory');
grid on;

%% Part 3: Projectile Motion for Different Angles
angles = [5, 15, 25, 35, 45, 55, 65, 75, 85]; % Angles in degrees
v0 = 20; % Arbitrary velocity

subplot(2,2,2);
hold on;
for i = 1:length(angles)
    theta = angles(i);
    vx = v0 * cosd(theta);
    vy = v0 * sind(theta);
    t_flight = 2 * vy / g;
    t = linspace(0, t_flight, 100);
    x = vx * t;
    y = vy * t - 0.5 * g * t.^2;
    plot(x, y, 'LineWidth', 1.5);
end
xlabel('Distance (m)');
ylabel('Height (m)');
title('Projectile Motion for Different Angles');
legend(arrayfun(@(x) sprintf('%d°', x), angles, 'UniformOutput', false));
grid on;

%% Part 4: Animation of Soccer Ball Trajectory
% I have no idea how this worked out.... 

subplot(2,2,[3,4]);
hold on;
for i = 1:length(t)
    plot(x(1:i), y(1:i), 'b', 'LineWidth', 1.5); % More plotting magic
    plot(x(i), y(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);
    xlabel('Distance (m)');
    ylabel('Height (m)');
    title('Soccer Ball Animation');
    axis([0 max(x) 0 max(y) + 1]); 
    grid on;
    drawnow;
    if i < length(t)
        cla;
    end
end
% For legal reasons, I got help online for this end part