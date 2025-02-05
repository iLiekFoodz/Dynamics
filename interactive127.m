clear, clc
close all
%Interactive 12.7 | Nouh Shaikh | Dynamics

x = -5:0.01:5;
y = -0.1*x.^2;

utx = [0 1];
uty = [0 0];

unx = [0 0];
uny = [0 -1];


plot(x,y,'k-.','LineWidth',1.5)
hold on
plot(utx,uty,'r','LineWidth',2.5)
plot(unx,uny,'g','LineWidth',2.5)
axis([-5 5 -6 4])
title('Problem 1, Path of a Particle with Vectors')
xlabel('X(m)')
ylabel('Y(m)')

