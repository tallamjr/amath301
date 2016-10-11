clear all

% original system Ax=b
A = [ 4 -1 1;
    4 -8 1;
    -2 1 5];
b = [ 7; -21; 15];

xsol = A\b;  % solution by LU-decomposition

% JACOBI ITERATION
% x_{k+1} = M * x_k + b2
M = [0 1/4 -1/4;
    4/8 0 1/8;
    2/5 -1/5 0];
b2 = [7/4; 21/8; 15/5];

x0 = [1; 2; 2]; % initial guess
tol = 1.e-6;  % keep iterating until error converges to <=tol
error = 2*tol; 
x(:,1) = x0;
iteration = 1;
while((error>tol)&&(iteration<100))
    iteration = iteration + 1;
    x(:,iteration) = M*x(:,iteration-1) + b2; % x_{k+1} = M * x_k + b2
    error = norm(x(:,iteration)-x(:,iteration-1),Inf);    % Worst component (infinity) error norm
end
trueiterations = iteration-1; % because initial condition x(:,1) doesn't count as iteration

plot(x')