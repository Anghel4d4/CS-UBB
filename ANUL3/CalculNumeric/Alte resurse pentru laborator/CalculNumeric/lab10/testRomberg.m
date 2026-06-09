function testRomberg()
%test functie Romberg pt calculul unei Integrale
%Vrem sa calculam Integrala de la 0 la pi din sin(x)dx, cu eps = 10^(-2)

%f - ce integrala vrem sa calculam
f = @(x) sinxpx(x);

%a, b - capele integralei
a = 0;
b = 500*pi;

epsi = 10e-8;

%apelul functiei
[IRomberg,k]=Romberg(f,a,b,epsi,50)
display(abs(pi/2-IRomberg))
%[IAdQuad,k]=adquad(f,a,b,epsi)
%display(abs(2-IAdQuad))
end

function y =sinxpx(x)
  y = ones(size(x));
  t=x~=0;
  y(t)=sin(x(t))./x(t);
end