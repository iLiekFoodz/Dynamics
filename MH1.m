%=======================================================
% MATLAB HW #1
% Name: Cameron LaMack
% Date: 2/3/2025
%=======================================================
clear,clc
close all

%% Problem 1
t = 0:0.01:10;
s = t.^3-9*t.^2+15*t;
v = 3*t.^2-18*t+15;
a = 6*t-18;

figure(1)
subplot(3,1,1)
plot(t,s,'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Position (ft)')
title('Kinematics of a Particle in Time, Problem 1')

subplot(3,1,2)
plot(t,v,'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Velocity (ft/s)')

subplot(3,1,3)
plot(t,a,'LineWidth',1.5)
xlabel('Time (s)')
ylabel('Acceleration (ft/s/s)')

%% Problem 2
v = 10; %m/s
theta = 39; %degreees
y0=0;
x0=0;
y_final=0;
g=-9.81; %m/s/s

vx = v*cosd(theta);
vy = v*sind(theta);

%use roots function to find t
p = [0.5*g, vy, y0-y_final];
t_temp = roots(p);
t_final = t_temp(2);
t = 0:0.01:t_final;

x=x0+vx*t;
y=y0+vy*t+0.5*g*t.^2;

figure(2)
plot(x,y,'LineWidth',1.5)
title('Path of a Projectile, Problem 2')
xlabel('Distance (m)')
ylabel('Height (m)')

%% Problem 3
v = 10; %m/s
y0=0;
x0=0;
y_final=0;
g=-9.81; %m/s/s

figure(3)
hold on

for theta = 5:10:85
    
    vx = v*cosd(theta);
    vy = v*sind(theta);

    %use roots function to find t
    p = [0.5*g, vy, y0-y_final];
    t_temp = roots(p);
    t_final = t_temp(2);
    t = 0:0.01:t_final;

    x=x0+vx*t;
    y=y0+vy*t+0.5*g*t.^2;
    plot(x,y,'LineWidth',1.5)
end
title('45^{o} Gives the Longest Path for a Projectile, Problem 3')
xlabel('Distance (m)')
ylabel('Height (m)')
legend('5^{o}','15^{o}','25^{o}','35^{o}','45^{o}','55^{o}','65^{o}','75^{o}','85^{o}')

%% Problem 4

v = 10; %m/s
theta = 39; %degreees
y0=0;
x0=0;
y_final=0;
g=-9.81; %m/s/s

vx = v*cosd(theta);
vy = v*sind(theta);

%use roots function to find t
p = [0.5*g, vy, y0-y_final];
t_temp = roots(p);
t_final = t_temp(2);
t = 0:0.01:t_final;

x=x0+vx*t;
y=y0+vy*t+0.5*g*t.^2;

figure(4)
for i = 1:length(t)
    plot(x(1:i),y(1:i),'LineWidth',1.5)
    hold on
    plot(x(i),y(i),'ko','MarkerSize',10,'MarkerFaceColor','black')
    title('Path of a Projectile, Problem 2')
    xlabel('Distance (m)')
    ylabel('Height (m)')
    title(['An Animated Soccer Ball at t = ',num2str(t(i)),' s, Problem 4'])
    axis([0 10 0 2.5])
    drawnow
    if i~=length(t) %don't clear the last frame
        clf
    end
end
