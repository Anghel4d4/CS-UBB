function [x,i] = GaussSeidel(A,b,x0,tol)

D = diag(diag(A));
U = triu(A-D);
L = tril(A-D);
count = 1;
T=inv(D+L)*(-U);
t=norm(T);
xnew = (inv(D+L))*(-U*x0 +b);
Error=norm(xnew-x0);
while Error>(1-t)/t*tol
    xnew = (inv(D+L))*((-U)*x0 +b);
    Error=norm(xnew-x0);
    x0 = xnew;
    count = count+1;
end
x = xnew;
i = count;
end