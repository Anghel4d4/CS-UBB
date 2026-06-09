d=5*ones(1,10);
e=-ones(1,10-1);
A=diag(d)+diag(e,1)+diag(e,-1);
b=[4; 3*ones(10-2,1); 4];

[x,NrIteratii] = jacobi(zeros(10,1), A, b, 0.0001, 100);
x
NrIteratii