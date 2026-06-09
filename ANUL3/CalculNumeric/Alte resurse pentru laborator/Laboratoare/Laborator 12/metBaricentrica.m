function B = metBaricentrica(x,f,t)
%polinomul de interpolare LaGrange, cu metoda baricentrica
%apel: B = metBaricentrica(x,f,t), unde:
%	x -  nodurile de interpolare
%	f - valorile functiei in noduri
%	t - valorile in care se calculeaza valoarea polinomului
%Rezultat:
%	B - rezultatul calculului, 
%adica valoarea (valorile) polinomului de interpolare


n=length(x)-1;
c=ones(1,n+1);
for j=1:n+1
    c(j)=prod(x(j)-x([1:j-1,j+1:n+1]));
end
c=1./c;
numer = zeros(size(t));
denom = zeros(size(t));
exact = zeros(size(t));
for j=1:n+1
    xdiff = t-x(j);
    temp = c(j)./xdiff;
    numer = numer+temp*f(j);
    denom = denom+temp;
    exact(xdiff==0) = j;
end
B = numer ./ denom;
jj = find(exact); 
B(jj) = f(exact(jj));