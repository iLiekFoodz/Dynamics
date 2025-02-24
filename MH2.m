%MH2

clear,clc
close all

%% Problem 1
W = 150; %lb
theta = 30; %degrees
g = 32.2; %ft/s^2
muk = 0.3;
s = 0:0.1:50;
m=W/g;

Fn = W*cosd(theta);

a = (W*sind(theta)-muk*Fn)/m;
v = sqrt(2*a*s); %from integrating a = v*dv/ds
figure(1)
plot(s,v,'LineWidth',1.5)
title('A Sliding Crate, Problem 1')
xlabel('Position (ft)')
ylabel('Velocity (ft/s)')

%% Problem 2 
g = 9.81; %m/s^2
m = 100; %kg
rho = 5; %m
theta = 0:0.1:60;

Fn = m*g*sind(theta)+m*(2*rho*g*sind(theta)+1)/rho;

figure(2)
plot(theta,Fn,'LineWidth',1.5)
title('The Normal Force of a Skateboarder, Problem 2')
xlabel('Position (degrees)')
ylabel('Normal Force (N)')


%% Problem 3


%Parameters
a_g = 32.2; %ft/s^2
m = 10/a_g; %slugs
h = 100; %ft
dt = 0.01; %seconds

%initial vectors
Fd = [];
F = [];
t = [];
a = [];
y = [];
v = [];
y(1) = h;
v(1) = 0;

Fg = -a_g*m;
t(1)=0;


k = 1;

while y(k) > 0
    %calculate next step
    Fd(k) = 0.018*0.39*v(k)^2;
    F(k)=Fg+Fd(k);
    a(k) = F(k)/m;
    v(k+1) = v(k)+a(k)*dt;
    y(k+1) = y(k)+v(k)*dt;
    
    %plot current position
    if mod(k,5) == 0
    figure(3)
    clf
    subplot(2,1,1)
    plot(0,y(k),'ko','MarkerFaceColor','k')
    hold on
    axis([-1 1 -1 h])
    title(['Falling Ball at t = ',num2str(t(k)),' seconds'])
    ylabel('Height (ft)')
        
    subplot(2,1,2)
    plot(t,Fd,'LineWidth',1.5)
    hold on
    plot([0,t(k)],ones(1,2)*Fg,'LineWidth',1.5)
    legend('Drag Force','Force of Gravity')
    xlabel('Time (s)')
    ylabel('Force (lbs.)')
    axis([0 3.48 -10 10])
        
    drawnow
    end
    
    t(k+1) = t(k)+dt;
    k = k+1;
    
end

