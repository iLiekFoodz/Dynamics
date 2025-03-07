clc; clear; close all;
%=======================================================
% MATLAB HW #3
% Name: Nouh Shaikh
% Date: 03/06/2025
%=======================================================
%% Given Data
movements = [
    1, 0.25, -0.15, -0.1, 0, 1;
    2, -0.15, 0.25, 0.1, 1, 0;
    3, 0.25, -0.15, -0.05, 0.25, 0.75;
    4, 0.25, -0.15, -0.02, 0.5, 0.5
];

dx = 0.001;

work_biceps = zeros(1,4);
work_triceps = zeros(1,4);

%% Work Calculation
for i = 1:4
    x_start = movements(i,2);
    x_end = movements(i,3);
    if x_start < x_end
        x = x_start:dx:x_end;
    else
        x = x_start:-dx:x_end;
    end
    
    if isempty(x)
        continue;
    end
    
    v = movements(i,4);
    alpha_bi = movements(i,5);
    alpha_tri = movements(i,6);
    
    F_bi = zeros(size(x));
    F_tri = zeros(size(x));
    
    for j = 1:length(x)
        [F_bi(j), ~, ~] = BiMusForce(alpha_bi, x(j), v);
        [F_tri(j), ~, ~] = TriMusForce(alpha_tri, x(j), v);
    end
    
    work_biceps(i) = trapz(x, F_bi);
    work_triceps(i) = trapz(x, -F_tri);
end

%% Work Bar Plot (Problem 1)
figure;
bar(1:4, [work_biceps; work_triceps]');
legend({'Biceps Work', 'Triceps Work'});
xlabel('Movement #'); ylabel('Work (Joules)');
title('Work Done by Muscles in 4 Movements');

%% Power Calculation and Plot (Problem 2) 
figure;
for i = 1:4
    subplot(2,2,i);
    x_start = movements(i,2);
    x_end = movements(i,3);
    if x_start < x_end
        x = x_start:dx:x_end;
    else
        x = x_start:-dx:x_end;
    end
    
    if isempty(x)
        continue;
    end
    
    v = movements(i,4);
    alpha_bi = movements(i,5);
    alpha_tri = movements(i,6);
    
    F_bi = zeros(size(x));
    F_tri = zeros(size(x));
    
    for j = 1:length(x)
        [F_bi(j), ~, ~] = BiMusForce(alpha_bi, x(j), v);
        [F_tri(j), ~, ~] = TriMusForce(alpha_tri, x(j), v);
    end
    
    P_bi = F_bi * v;
    P_tri = -F_tri * v;
    
    plot(x, P_bi, 'b', 'LineWidth', 1.5); hold on;
    plot(x, P_tri, 'r', 'LineWidth', 1.5);
    legend({'Biceps Power', 'Triceps Power'});
    xlabel('Mass Position (m)'); ylabel('Instantaneous Power (W)');
    title(['Movement #' num2str(i)]);
end