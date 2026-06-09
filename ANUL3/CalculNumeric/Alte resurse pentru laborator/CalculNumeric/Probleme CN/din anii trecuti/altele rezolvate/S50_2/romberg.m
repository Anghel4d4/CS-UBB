function I=romberg(f,a,b,e,nmax)
%ROMBERG - calculul unei integrale prin metoda lui Romberg
%f -functia
%a,b - limitele de integrare
%e - eroarea
%nmax - numar maxim de iteratii
if nargin < 5
nmax=10;
end
if nargin < 4
e=1e-3;
end
R=zeros(nmax,nmax);
h=b-a;
% prima iteratie
R(1,1) = ((b-a)/2)*( feval(f,a)+feval(f,b));
for k=2:nmax
%formula trapezelor;
x=a+([1:2^(k-2)]-0.5)*h;
suma = 0;

for m=1:2^(k-2)
    suma = suma + feval(f, x(m));
end
    R(k,1)=0.5*(R(k-1,1)+h*suma);
%extrapolare
plj=4;
for j=2:k
R(k,j)=(plj*R(k,j-1)-R(k-1,j-1))/(plj-1);
plj=plj*4;
end
if (abs(R(k,k)-R(k-1,k-1))<e)&(k>3)
I=R(k,k);
return
end
%dublare noduri
h=h/2;
end
error('prea multe iteratii')