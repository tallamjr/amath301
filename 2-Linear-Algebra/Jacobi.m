function [xout,iterations] = Jacobi(A,b,x0,tol,maxIter)

d = diag(A);
D = diag(d);
T = A-D;

error = 2*tol;
X(:,1) = x0;
iterations = 1;
while((error>tol)&&(iterations<maxIter))
    iterations = iterations + 1;
    X(:,iterations) = D\(b-T*X(:,iterations-1));
    error = norm(X(:,iterations)-X(:,iterations-1),Inf);
end
xout = X(:,end);
iterations = iterations-1; % initial guess doesn't count as an iteration