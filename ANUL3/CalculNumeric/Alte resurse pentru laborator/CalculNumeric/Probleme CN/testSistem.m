clc
n=5;
A=2*diag(ones(1,n))+diag(ones(1,n-1),1)+diag(ones(1,n-1),-1);
b=A*ones(5,1);
%R=factCholeskyTD(A);
x4 = rezolvaCholeskyTD(A,b)