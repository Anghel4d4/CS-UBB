function [x,la]=Power_method(A,x0,er,nmax)
%POWER_METHOD - metoda puterii pentru vectori si valori proprii
%apel [x,la]=Power_method(A,x0)
%A - matricea
%x0 - vector de pornire
%er - eroarea relativa
%nmax numar maxim de iteratii
%la - valoarea proprie dominanta
%x - vectorul propriu corespunzator

if nargin<4, nmax=100; end
if nargin<3, er=eps; end
xv=x0/norm(x0); 
for i=1:nmax
    y=A*xv;
    xn=y/norm(y);
    la=xn'*A*xn;
    if norm(xn-xv)<er
        x=xn;
        return
    end
    xv=xn;
end
x=xn;
warning('prea multe iteratii')