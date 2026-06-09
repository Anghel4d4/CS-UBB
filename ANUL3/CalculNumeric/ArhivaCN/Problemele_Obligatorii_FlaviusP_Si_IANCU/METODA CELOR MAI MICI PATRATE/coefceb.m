function c=coefceb(f,n,p)
%COEFCEB - coeficienti Cebisev mcmmp
%apel c=coefceb(f,n,p)
%f - functia
%n - gradul
%p - tabela coeficientilor

if nargin < 3
    p=polceb(n);
end
for k=1:n+1
    c(k)=2/pi*quadl(@fceb,0,pi,1e-10,0,f,k-1);
end
function y=fceb(x,f,k)
y=cos(k*x).*f(cos(x));