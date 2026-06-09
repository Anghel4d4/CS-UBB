function [lambda,it]=QRMethod1(A,t)
%QRMETHOD1 - Calcululeaza valorile proprii ale unei matrice reale
%implementarea naiva
%intrare 
%    A - matricea
%    t - toleranta
%iesire
%    lambda - valorile proprii - diagonala lui R
%    it - numar de iteratii

H=hessen_h(A);
it=0;
while norm(diag(H,-1),inf) > t
    H=HessenRQ(H);
    it=it+1;
end
lambda=diag(H);
    
