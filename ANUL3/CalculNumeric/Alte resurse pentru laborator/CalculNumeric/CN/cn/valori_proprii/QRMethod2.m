function [lambda,it]=QRMethod2(A,t)
%QRMETHOD2 - Calcululeaza valorile proprii ale unei matrice reale cu metoda 
%QR si deplasare
%intrare 
%    A - matricea
%    t - toleranta
%iesire
%    lambda - valorile proprii - diagonala lui R
%    it - numar de iteratii

[m,n]=size(A); II=eye(n);
H=hessen_h(A);
it=0;

while norm(diag(H,-1),inf) > t
    m = H(n,n);
    H = HessenRQ(H - m * II) + m*II;
    it=it+1;
end
lambda=diag(H);
    
