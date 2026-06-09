function [H1,H2,It]=QRDouble(H,t)
%QRDOUBLE - executa iteratia QR cu dublu pas si transformare inversa pe matricea HouseHolder 
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
while m>t
    It=It+1;
    X = H*H ... %Matricea X
        - (H(n-1,n-1) + H(n,n)) * H ...
        + (H(n-1,n-1)*H(n,n) - H(n,n-1)*H(n-1,n))*II;
    [Q,R]=qr(X);
    H=hessen_h(Q'*H*Q);
    [m,j]=min(abs(diag(H,-1)));
end
H1=H(1:j,1:j);
H2=H(j+1:n,j+1:n);
