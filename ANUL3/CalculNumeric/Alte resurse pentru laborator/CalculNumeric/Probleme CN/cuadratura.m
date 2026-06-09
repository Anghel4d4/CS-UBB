%calculul formulei de cuadratura 
clc
clearvars
syms a b
n=3;
beta=(4-sym(1:n-1).^(-2)).^(-1); 
alpha=zeros(1,n);
J=diag(alpha)+diag(sqrt(beta),1)+diag(sqrt(beta),-1);
[V,D]= eig((J));
%normalizam V
for k=1:3
    V(:,k)=V(:,k)/sqrt(sum(V(:,k).^2));
end

x=diag(D);
A=2*V(1,:).^2;
%rezultatul pana aici este 5/9*f(-sqrt(15)/5)+8/9*f(0)+ 5/9*f(sqrt(15)/5)

%schimb de variabila
t=simplify((a+b)/2+(b-a)/2*x);
A=simplify(A*(b-a)/2);

disp(A)
disp(t)




