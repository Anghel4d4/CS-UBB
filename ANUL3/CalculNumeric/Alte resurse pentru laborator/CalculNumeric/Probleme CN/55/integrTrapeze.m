function int=integrTrapeze(f,a,b,n)

%fprintf('a=%g b=%g \n',a,b);
x=a:((b-a)/n):b;
sum=0;

for k=2:length(x)-1
        sum=sum+f(x(k));
end;
int=(b-a)/2/n*(f(a)+f(b)+sum*2);
