function [H1,H2,It]=QRIter2(H,t)
%QRITER - executa iteratia QR pe matricea HouseHolder 
%pana cand cel mai mic element subdiagonal este < t
%Intrare
% H - matricea Hessenberg
% t - toleranta
%Rezultate
%H1, H2 - descompunerea dupa elementul minim
%It - numar de iteratii

It=0; [m,n]=size(H);
II=eye(n);
[m,j]=min(abs(diag(H,-1))); 
while m > t
    It=It+1;
    H=HessenRQ(H-H(n,n)*II)+H(n,n)*II;
    [m,j]=min(abs(diag(H,-1)));
end
H1=H(1:j,1:j);
H2=H(j+1:n,j+1:n);
