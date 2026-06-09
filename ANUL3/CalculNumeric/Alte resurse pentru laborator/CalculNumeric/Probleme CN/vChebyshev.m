function y = vChebyshev(x, n)
%VCHEBYSHEV - calculul valorilor polinomului Cebyshev
%apel y=vChebyshev(x,n)
%x - punctele
%n - gradul
%y - valorile polinomului Cebyshev

pnm1=ones(size(x));
if n==0, y=pnm1; return; end
pn=x;
if n==1, y=pn; return; end
for k=2:n
    y=2*x.*pn-pnm1;
    pnm1=pn;
    pn=y;
end