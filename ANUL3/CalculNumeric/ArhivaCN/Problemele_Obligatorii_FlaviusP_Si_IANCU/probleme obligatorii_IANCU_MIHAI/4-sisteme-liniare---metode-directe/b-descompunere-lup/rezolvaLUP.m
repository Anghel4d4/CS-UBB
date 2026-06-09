function x = rezolvaLUP(L,U,P,b)
% rezolva sistemlul L*U*x = P*b
% Algoritmul 2
[n,m] = size(L);
if (n~=m)
    error('matricea L nu este patratica');
end

x= zeros(n, 1);
b=P*b;
for i=1:n
    suma = 0;
    for j=1:(i-1)
        suma = suma + L(i,j)*y(j);
    end
    y(i) = b(i)- suma;
end
for i=n:-1:1
    suma = 0;
    for j=(i+1):n
        suma = suma + U(i,j)*x(j);
    end
    x(i) = (y(i) - suma)/U(i,i);
end