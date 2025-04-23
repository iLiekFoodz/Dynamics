clc; clear; close all;
%=======================================================
% MATLAB HW #5
% Name: Nouh Shaikh
% Date: 04/23/2025
%=======================================================

% Constants
g = 9.81;            % gravitational acceleration (m/s^2)
m_cart = 10;         % mass of the cart (kg)
h = 1;               % height of the box's center of mass from the ground (m)

%% Problem 1: Vary mass of the box
mass_box_range = 50:10:250;    % Mass of the box (kg)
width_box = 0.5;               % Fixed width (distance from handle to center of mass)

P_max1 = zeros(size(mass_box_range));   % To store maximum P for Problem 1

for i = 1:length(mass_box_range)
    m_box = mass_box_range(i);

    % Take moments about the front wheel (tipping condition)
    P_max1(i) = (m_box * g * width_box + m_cart * g * (width_box / 2)) / h;
end

%% Problem 2: Vary width of the box
width_box_range = 0.5:0.05:1.5;  % Box widths from 0.5 to 1.5 meters
m_box_fixed = 150;              % Fixed mass of the box (kg)

P_max2 = zeros(size(width_box_range));  % To store maximum P for Problem 2

for i = 1:length(width_box_range)
    w = width_box_range(i);

    % Take moments about front wheel
    P_max2(i) = (m_box_fixed * g * (w / 2) + m_cart * g * (w / 2)) / h;
end

%% Plot both results in subplots
figure;

% Subplot for Problem 1
subplot(2,1,1);
plot(mass_box_range, P_max1, 'b-o', 'LineWidth', 2);
xlabel('Mass of Box (kg)');
ylabel('Maximum Force P (N)');
title('Problem 1: Max Force vs Box Mass');
grid on;

% Subplot for Problem 2
subplot(2,1,2);
plot(width_box_range, P_max2, 'r-s', 'LineWidth', 2);
xlabel('Width of Box (m)');
ylabel('Maximum Force P (N)');
title('Problem 2: Max Force vs Box Width');
grid on; 

% Optional: Overall figure title (if needed)
sgtitle('Maximum Force Required to Prevent Tipping'); %something new I learned lol so hell yeah. 
