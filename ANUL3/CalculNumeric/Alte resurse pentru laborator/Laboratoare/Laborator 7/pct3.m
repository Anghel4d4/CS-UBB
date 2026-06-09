% Problema 3
n=1e5;
[A,b]=genMatRar(n);
x0=zeros(n,1);
err=1e-8;
nitmax=2*n;
[x,ni]=Jacobi(A,b,x0,err,nitmax);
[x2,ni2]=Gauss_Seidel(A,b,x0,err,nitmax);
w =  1.2876;
[x3,ni3]=relax(A,b,w,x0,err,nitmax);
