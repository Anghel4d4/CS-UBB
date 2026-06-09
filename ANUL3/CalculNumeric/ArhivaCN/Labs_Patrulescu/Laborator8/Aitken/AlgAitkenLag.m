function rez=AlgAitkenLag(x,f,xb,epsilon)
%functie care implementeaza algoritmul Aitken pentru polinomul Lagrange
% x-vectorul de noduri 
% f-valorile functiei pentru nodurile x
% xb - punctul pentru care se aproximeaza valoarea

m=length(x)-1; % se considera m+1 puncte
A=zeros(m+1,m+1);


for i=1:m% se ordoneaza nodurile in functie de distanta pana la xb
  for j=i+1:m+1
     if abs(xb-x(i))>abs(xb-x(j))
         aux=x(i);
         x(i)=x(j);
         x(j)=aux;
         auxf=f(i);
         f(i)=f(j);
         f(j)=auxf;
     end
  end
end
A(:,1)=f;
Diferenta=x-xb;
for i=2:m+1
    for j=1:i-1
        A(i,j+1)=(A(j,j)*Diferenta(i)-A(i,j)*Diferenta(j))/(x(i)-x(j));
    end
    if abs(A(i,i)-A(i-1,i-1))<=epsilon
        rez=A(i,i);
    return
    end
end
rez=A(m+1,m+1);

