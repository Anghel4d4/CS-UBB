function x = GaussTridiagonal(A, b)
% Solve linear system Ax = b
% using Gaussian elimination without pivoting
% A is an n by n matrix
% b is an n by n matrix (n copies of n-vectors) %identity matrix
% x is an n by n matrix (n copies of solution vectors)
[n, n] = size(A);     % Find size of matrix A
x = zeros(n);      % Initialize x
for i = 1:n-1
    m = -A(i+1,i)/A(i,i); % multipliers  % A(i+1:n,i)for general matrix-->for tridiagonal A(i+1,i)
    A(i+1,i:i+1) = A(i+1,i:i+1) + m*A(i,i:i+1);  %A(i+1:n,:)-->A(i+1,i:i+1) for tridiagonal matrix 
                                                 %A(i,:)-->A(i,i:i+1) for tridiagonal matrix 
    b(i+1,1:i+1) = b(i+1,1:i+1) + m*b(i,1:i+1);  % b(i+1:n,:)-->b(i+1,1:i+1) b-initial identity matrix
end;
% Use back substitution to find unknowns
x(n,:) = b(n,:)/A(n,n);
for i = n-1:-1:1
    x(i,:) = (b(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end