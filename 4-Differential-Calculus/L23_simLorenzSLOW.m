clear all

% Lorenz's parameters (chaotic)
sigma = 10;
beta = 8/3;
rho = 28;

% Initial condition - large cube of points
xvec = -20:2:20;
yvec = -20:2:20;
zvec = -20:2:20;
[x0,y0,z0] = meshgrid(xvec,yvec,zvec);
yIC(1,:,:,:) = x0;
yIC(2,:,:,:) = y0;
yIC(3,:,:,:) = z0;

plot3(yIC(1,:),yIC(2,:),yIC(3,:),'r.','LineWidth',2,'MarkerSize',4)
axis([-40 40 -40 40 -40 40])
view(20,40);
drawnow

%% Compute trajectory 
dt =0.01;
duration = 4
tspan=[0,duration]; 
L = duration/dt; 
yparticles = yIC; 

% this code is slow because MATLAB is not compiled
% we use nested for loops to step through every single IC in the cube
% one at a time...
for step=1:L
    time = step*dt   
    for i=1:length(xvec)
        for j=1:length(yvec)
            for k=1:length(zvec)
                yin = yparticles(:,i,j,k);
                yout = rk4singlestep(@(t,y)lorenz(t,y,sigma,beta,rho),dt,time,yin);
                yparticles(:,i,j,k) = yout;
            end
        end
    end
    plot3(yparticles(1,:),yparticles(2,:),yparticles(3,:),'r.','LineWidth',2,'MarkerSize',4)
    view(20,40);
    axis([-40 40 -40 40 -10 40])
    drawnow
end