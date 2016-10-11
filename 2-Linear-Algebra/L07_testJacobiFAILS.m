clear all

% original system Ax=b  (swapped first and third rows!)
A = [-2 1 5
    4 -8 1;
    4 -1 1 ];
b = [ 15; -21; 7];

xsol = A\b;

% JACOBI ITERATION
% x_{k+1} = M * x_k + b2
M = [0 1/2 5/2;
    4/8 0 1/8;
    -4 1 0];
b2 = [-15/2; 21/8; 7];

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