function nc=condpol(p,xi,m)
%p - coeficientii
%xi- radacinile 
%m - multiplicitatiile radacinilor
%apel nc=condpol(p,xi,m)
nc=zeros(length(xi),1);
n=length(p);
c=n-1:-1:1;
z=c;
for j=1:length(m) 
for i=1:m(j)-1
    z1=z-1;
    c=c.*z1;
    z=z1;
end
dp=c(1:n-m(j)).*p(1:end-m(j));
nc(j)=(factorial(m(j))./(abs(xi(j).*polyval(dp,xi(j)))).*(polyval(abs(p(1:end)),abs(xi(j))))).^(1/m(j));
end

