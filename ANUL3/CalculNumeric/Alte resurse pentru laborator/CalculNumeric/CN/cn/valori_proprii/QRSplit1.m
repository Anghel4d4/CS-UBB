function [lambda,It]=QRSplit1(A,t)
%QRSPLIT1 calculul valorilor proprii cu metoda QR si partitionare
%Intrare
%A - matricea
%t - toleranta
%Rezultate
%lambda - valorile proprii

[m,n]=size(A);
if n>1
    H=hessen_h(A);   %aducere la forma Hessenberg
    [H1,H2,It]=QRIter(H,t); %descompunere H->H1,H2
    %apel recursiv
    [l1,It1]=QRSplit1(H1,t);
    [l2,It2]=QRSplit1(H2,t);
    It=It+It1+It2;
    lambda=[l1;l2];
else
    It=0;
    lambda=A;
end