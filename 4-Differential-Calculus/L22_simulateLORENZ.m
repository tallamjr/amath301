clear all

% Lorenz's parameters (chaotic)
sigma = 10;
beta = 8/3;
rho = 28;

% Initial condition
y0=[-8; 8; 27];

% Compute trajectory 
dt =0.01;
tspan=[0:dt:4]; 

Y(:,1)=y0;
yin = y0;
for i=1:tspan(2)/dt
    time = i*dt;
    yout = rk4singlestep(@(t,y)lorenz(t,y,sigma,beta,rho),dt,time,yin);
    Y = [Y yout];
    yin = yout;
end
plot3(Y(1,:),Y(2,:),Y(3,:),'b')
hold on
[t,y] = ode45(@(t,y)lorenz(t,y,sigma,beta,rho),tspan,y0);
plot3(y(:,1),y(:,2),y(:,3),'r')