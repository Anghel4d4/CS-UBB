%aplicarea formulei de cuadratura
clc
I0=1/5*(1-exp(-2*pi))
f=@(x)cos(2*x)./exp(x);
quad(f,0,2*pi)

n=120;
x=linspace(0,2*pi,n+1);
I=0;
for i=1:n
    I=I+ pasCuadratura(f, x(i), x(i+1));
end
% sau vectorial: I=sum(arrayfun(@(a,b)pasCuadratura(f,a,b), x(1:n), x(2:n+1)))
disp(I)