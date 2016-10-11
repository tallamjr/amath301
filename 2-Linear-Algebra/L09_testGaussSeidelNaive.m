clear all

% original A matrix
A = [4 -1 1;
    4 -8 1;
    -2 1 5];
b = [7;-21;15];

D = diag(diag(A));
T = A-D;
bd = D\b;
TD = D\T;

tol = 1.e-6;
error = 2*tol;
x0 = [1;2;2];
X(:,1) = x0;
iterations = 1;
while(error>tol)
    iterations = iterations + 1;
    X(:,iterations) = X(:,iterations-1);
    for i=1:size(T,2)
        X(i,iterations) = bd(i) - TD(i,:)*X(:,iterations);
    end
    error=norm(X(:,iterations)-X(:,iterations-1),Inf);
end