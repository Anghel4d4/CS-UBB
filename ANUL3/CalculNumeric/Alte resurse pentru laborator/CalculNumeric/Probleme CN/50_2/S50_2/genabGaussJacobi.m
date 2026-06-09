function [alpha,bet]=genabGaussJacobi(n,a,b)
al=zeros(1,n+1);
for i=1:n+1
    al(i)=(b^2-a^2)/((2*i+a+b)*(2*i+a+b+2));
end
bl=zeros(1,n+1);
bl(1)=(2^(a+b+1))*beta(a+1,b+1);
for i=2:n+1
    bl(i)=(4*i*(i+a)*(i+a+b)*(i+b))/((2*i+a+b-1)*((2*i+a+b)^2)*(2*i+a+b+1));
end
alpha=a;
bet=b;