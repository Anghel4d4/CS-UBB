%Generarea unor cuadraturi de tip Gauss cu polinoamele lui Legendre
function rezultat=cuadraturi_Gauss(a,b,n,f)
J=zeros(n);
for i=1:n-1
   t=sqrt(1/(4-i^-2));
   
   
   J(i,i+1)=t;
   J(i+1,i)=t;
end
%J - matricea Jacobi de ordinul n

[v,x]=eig(J);
%in v sunt vectorii proprii matricii J pe coloane
%in x sunt valorile proprii matricii J pe diagonala

beta0=2;  
for k=1:n
   A(k)=beta0*v(1,k)^2;
end
%coeficientii A(k)

suma=0;
for k=1:n
   q=(b+a)/2+((b-a)/2)*x(k,k); %x(k,k) radacinile polinomului lui Legendre
   suma=suma+A(k)*feval(f,q);
end
suma=suma*((b-a)/2);
rezultat=suma;