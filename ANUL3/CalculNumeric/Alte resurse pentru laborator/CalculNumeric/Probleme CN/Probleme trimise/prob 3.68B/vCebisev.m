function y=vCebisev(x,n)
%VCEBISEV - calculul valorilor polinomului Cebisev
%apel y=vCebisev(x,n)
%x - punctele
%n - gradul
%y - valorile polinomului Cebisev

pnm1=ones(size(x));
if n==0, y=pnm1; return; end
pn=x;
if n==1, y=pn; return; end
for k=2:n
    y=2*x.*pn-pnm1;
    pnm1=pn;
    pn=y;
end