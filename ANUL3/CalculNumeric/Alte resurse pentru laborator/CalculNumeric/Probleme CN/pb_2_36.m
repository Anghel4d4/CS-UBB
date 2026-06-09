%definim matricea A 
A=[9,-6; 12,-8; 0,20];
%definim matricea B - o matrice de 1x3, reprezentand termenii din dreapta
%sistemului de ecuatii
B=[300;600;900];

%factorizam QR
[Q,R] = qr(A);
%disp(Q);
%disp(R);

%calculam d=Q'*B
d=Q'*B;

%rezolvam sistemul R*x=d ce ne va da solutiile sistemului
x=R\d

%verificare:
%x2=A\B