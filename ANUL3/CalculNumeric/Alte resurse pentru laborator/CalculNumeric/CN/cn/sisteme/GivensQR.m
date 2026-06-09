function [R,Q]=GivensQR(A)
%GIVENSQR - factorizare QR cu rotatii Givens

[m,n]=size(A);
for j=1:n
    for i=m:-1:j+1
        [c,s]=Givens(A(i-1,j),A(i,j));
        A(i-1:i,j:n)=[c,-s; s,c]*A(i-1:i,j:n);
        A(i,j)=encode(c,s);
    end
end
R=triu(A(1:n,:));
