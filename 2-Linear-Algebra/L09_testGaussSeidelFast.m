clear all

% original A matrix
A = [4 -1 1;
    4 -8 1;
    -2 1 5];
b = [7;-21;15];

D = diag(diag(A));
S = tril(A);
T = triu(A)-D;

tol = 1.e-6;
error = 2*tol;
x0 = [1; 2; 2];
X(:,1) = x0;
iterations = 1;

while(error>tol)
    iterations = iterations + 1;
    X(:,iterations) = S\(b-T*X(:,iterations-1));
    error = norm(X(:,iterations)-X(:,iterations-1),Inf);
end      
xout = X(:,end);