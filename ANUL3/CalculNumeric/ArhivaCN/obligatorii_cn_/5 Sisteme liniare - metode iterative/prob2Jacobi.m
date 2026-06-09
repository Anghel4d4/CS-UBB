format long;
n=100;
N=n*n;
%A=4*eye(N) - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1) - diag(ones(N-n,1),n) - diag(ones(N-n,1),-n);
%B=sparse(A);

e= ones(N,1);
A=spdiags([-e,-e, 4*e, -e, -e], [-n,-1,0,1,n], N, N);


b=A*ones(N,1);
Nr_it=200000;
epsilon= 1e-8;

%[xJ,countJ]=Jacobi(A,b,Nr_it,epsilon)

[S,ni]=Jacobi2(A,b, zeros(N,1),epsilon,Nr_it);
S

norm( S);
cond(S);




