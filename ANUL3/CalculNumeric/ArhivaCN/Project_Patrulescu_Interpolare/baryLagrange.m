function ff=baryLagrange(x,y,xx)
%BARYLAGRANGE - interpolare lagrange metoda baricentrica
%x -  x`urile x1,x2...
%y - valorile functiei in x`uri
%xx - punctele de interpolare
%ff - valorile polinomului de interpolare


%calculeaza w`urile
n=length(x);
w=ones(1,n);
for j=1:n
    w(j)=prod(x(j)-x([1:j-1,j+1:n]));
end
w=1./w;
numer = zeros(size(xx));
denom = zeros(size(xx));
exact = zeros(size(xx));
for j=1:n
    xdiff = xx-x(j);
    temp = w(j)./xdiff;
    numer = numer+temp*y(j);
    denom = denom+temp;
    exact(xdiff==0) = j;
end
ff = numer ./ denom;
%ff
%jj = find(exact); % vector cu toti indicii unde valorile elementelor sunt diferite de 0
%ff(jj) = y(exact(jj));

