format long;
n=10;
N=n*n;
A=4*eye(N) - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1) - diag(ones(N-n,1),n) - diag(ones(N-n,1),-n);

b=A* ones(N,1);
[L,U,P]=lup(A);
norm( L* U - P* A);
cond(A);
y= forwardsubst(L, P*b);
x=backsubst(U, y)


