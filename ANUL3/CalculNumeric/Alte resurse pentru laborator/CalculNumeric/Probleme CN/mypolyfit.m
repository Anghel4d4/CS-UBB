function c=mypolyfit(x,y)
%calculeaza coeficientii polinomului de grad 1
%care aprox in sensul celor mai mici patrate datele x y
m=length(x);
if m ~= length(y)
    error('x si y au lungimi diferite');
end
A=zeros(2);
b=zeros(2,1);
for i=1:2
   for j=1:2
      A(i,j)=x.^(2-j)*(x.^(2-i))'; 
   end
   b(i)=(x.^(2-i))*(y)';
end
c=A\b;
c=c';
end