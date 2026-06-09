function c = polyfit1(x,y,n)
% se gaseste coef polinomului care aproximeaza datele x,y, m sensul cmmp
m = length(x);
if m ~= length(y)
    error('x si y nu au aceeasi lungime')
end
A = zeros(n+1);
b = zeros(n+1,1);

for i=1:n+1
    for j=1:n+1
       A(i,j) = x.^(n-i+1)* x'.^(n-j+1);
    end
    b(i) = y*x'.^(n-i+1);
end

c = A\b;
c = c';
