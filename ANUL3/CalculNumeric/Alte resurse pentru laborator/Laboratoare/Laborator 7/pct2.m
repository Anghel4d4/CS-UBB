% Problema 2
n=10;
[A,b]=genMatDens(n);
x=lupSolve(A,b);
R=chol(A);
y=R'\b;
x2=R\y;
