function z=pNewton(td,x,t)
%pNewTon - calculeaza PIL in forma Newton
%apel z=Newton(td,x,t)
%td - tabela diferentelor divizate
%x - nodurile de interpolare
%t - punctele in care se calculeaza valoarea
% polinomului de interpolare
%z - valorile polinomului de interpolare

lt=length(t); lx=length(x);
for j=1:lt
   d=t(j)-x;
   z(j)=[1,cumprod(d(1:lx-1))]*td(1,:)';
end
