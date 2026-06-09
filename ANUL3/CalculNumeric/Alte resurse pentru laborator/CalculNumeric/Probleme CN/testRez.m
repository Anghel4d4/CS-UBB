clc
n=7;
A=round(normrnd(0,10,n,n));
inversa=zeros(n,n);
I=eye(n);
for i=1:n
    inversa(1:n,i)=rezolvaLUP(A,I(:,i));
end
inversa
inv(A)
invLUP(A)
