function [z,ni]=Newton
%NEWTON - metoda lui Newton pentru ecuatii neliniare in R si R^n
%apel [z,ni]=Newton(f,fd,x0,ea,er,nmax)
%Intrare
%f - functia
%fd - derivata
%x0 - aproximatia initiala 
%ea - eroarea absoluta
%er - eroarea relativa
%nmax - numarul maxim de iteratii
%Iesire
%z - aproximatia radacinii
%ni - numarul de iteratii


er=0;
nmax=50;
ea=1e-3;
x0=[0,1];
xp=x0(:);   %x precedent

f = @(x) exp(-x^2)-cos(x)-1;
fd = @(x) -2*x*exp(-x^2)+sin(x);

xk1=xp;
xk2=xp;

for k=1:nmax
    if nargin < 7, ea=1e-3; 
        m=4%log(f(xk1)/f(xk2))/log((xk1-xk)/(xk2-xk));
    end
    xc=m*xp-fd(xp)^(-1)*f(xp);
    if norm(xc-xp,inf)<ea+er*norm(xc,inf)
        z=xc; %succes
        ni=k;
        return
    end
    xk2=xk1;
    xk1=xp;
    xp=xc;
end
error('S-a depasit numarul maxim de iteratii');