format long;
%{
A=[1 5 1; 5 1 1; 1 -1 5];
[L,U,P]=lup(A);
norm( L* U - P* A);

n=200;
A=rand(n);
b=A* ones(n,1);
[L,U,P]=lup(A);
norm( L* U - P* A);
cond(A);

y= forwardsubst(L, P*b);
x=backsubst(U, y)
%}

n=200;

A=[[eye(n, n-1) + tril(- ones(n, n-1), -1)], ones(n,1)];
b=A* ones(n,1);
[L,U,P]=lup(A);
norm( L* U - P* A);
cond(A);
y= forwardsubst(L, P*b);
x=backsubst(U, y)



%{

Ax=b
QRx=b
Rx=Q*b
%}

[Q,R]=qr(A);
x=R\(Q'*b)

