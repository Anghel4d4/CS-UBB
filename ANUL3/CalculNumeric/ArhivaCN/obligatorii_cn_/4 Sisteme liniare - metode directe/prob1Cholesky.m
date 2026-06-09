format long;
n=10;
N=n*n;

%matricea sistemului
A=4*eye(N) - diag(ones(N-1,1),1) - diag(ones(N-1,1),-1) - diag(ones(N-n,1),n) - diag(ones(N-n,1),-n);

%vector coloana cu solutiile
b=A* ones(N,1);

%Cholesky - daca e matrice hermitiana
R=Cholesky(A);

cond(A);

%solutia
x = R\(R'\b)


