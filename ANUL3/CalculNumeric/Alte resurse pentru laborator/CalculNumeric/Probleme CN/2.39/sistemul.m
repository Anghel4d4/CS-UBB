function [A,b]=sistemul(n)
I=eye(n);
I=I(n:-1:1,:);
b=1.5*ones(n,1);
b(1)=2.5;
b(n)=2.5;
if mod(n,2)==0
    I(n/2,:)=zeros(1,n);   b(n/2)=1;
    I(n/2+1,:)=zeros(1,n); b(n/2+1)=1;
else
    I((n-1)/2+1,:)=zeros(1,n); b((n+1)/2)=1;
end

A=diag(3*ones(1,n))+diag(-ones(1,n-1),-1)+diag(-ones(1,n-1),1)+1/2*I;

