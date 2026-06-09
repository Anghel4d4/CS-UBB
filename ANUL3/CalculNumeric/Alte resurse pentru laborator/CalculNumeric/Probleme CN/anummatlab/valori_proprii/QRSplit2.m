function [lambda,It]=QRSplit2(A,t)
%QRSPLIT2 calculul valorilor proprii cu metoda QR partitionare, deplasare si tratare
%speciala a  amtricelor 2x2
%Intrare
%A - matricea
%t - toleranta
%Rezultate
%lambda - valorile proprii
%It - numar de iteratii

[m,n]=size(A);
if n==1
    It=0;
    lambda=A;
    return
elseif n==2
    It=0;
    lambda=Eigen2x2(A);
    return
else
    H=hessen_h(A);   %aducere la forma Hessenberg
    [H1,H2,It]=QRIter2(H,t); %descompunere H->H1,H2
    %apel recursiv
    [l1,It1]=QRSplit2(H1,t);
    [l2,It2]=QRSplit2(H2,t);
    It=It+It1+It2;
    lambda=[l1;l2];
end