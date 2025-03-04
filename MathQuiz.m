% Define the grid for x and y
[x, y] = meshgrid(-2:0.01:2, -2:0.01:2);

% Define the ellipse equation
ellipse = x.^2 + 2*y.^2 - 4;

% Define the level curves
level_curve1 = x + 4*y - 6;  % For c = 12
level_curve2 = x + 4*y + 6;  % For c = -12

% Plot the ellipse
figure;
contour(x, y, ellipse, [0 0], 'b', 'LineWidth', 2);
hold on;

% Plot the level curves
contour(x, y, level_curve1, [0 0], 'r', 'LineWidth', 2);
contour(x, y, level_curve2, [0 0], 'g', 'LineWidth', 2);

% Mark the points of tangency
plot(2/3, 4/3, 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10); % Point (2/3, 4/3)
plot(-2/3, -4/3, 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 10); % Point (-2/3, -4/3)

% Add labels and title
xlabel('X-Axis');
ylabel('Y-Axis');
title('Ellipse and Level Curves');
legend('Ellipse: x^2 + 2y^2 = 4', 'Level Curve: x + 4y = 6', 'Level Curve: x + 4y = -6', ...
       'Point of Tangency: (2/3, 4/3)', 'Point of Tangency: (-2/3, -4/3)');
grid on;
axis equal; % Ensure equal scaling for x and y axes
hold off;