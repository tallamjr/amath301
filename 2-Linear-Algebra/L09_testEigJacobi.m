clear all

% original A matrix
A1 = [4 -1 1;
    4 -8 1;
    -2 1 5]

% A matrix with rows 1 and 3 swapped (same solution!)
A2 = [A1(3,:);
    A1(2,:);
    A1(1,:)]


d1 = diag(A1); % vector of diagonal elements of A1
D1 = diag(d1); % arrange this vector into a diagonal matrix

d2 = diag(A2); % vector of diagonal elements of A2
D2 = diag(d2); % arrange this vector into a diagonal matrix

% everything else
T1 = A1-D1;
T2 = A2-D2;

% these eigenvalues are inside the complex unit circle (STABLE)
abs(eig(D1\T1)) % abs(eig(X)) gives the length of the complex eigenvalues of X

% these eigenvalues are not inside the complex unit circle (UNSTABLE)
abs(eig(D2\T2))