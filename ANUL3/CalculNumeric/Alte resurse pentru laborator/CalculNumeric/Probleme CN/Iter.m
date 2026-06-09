function [z,ni]=Iter(f,x0,ea,er,Nmax)

if nargin<6, Nmax=50; end
if nargin<5, er=0; end
if nargin<4, ea=1e-3; end
xv=x0;
for k=1:Nmax
    xc=xv-f(xv).^2./(f(xv+f(xv))-f(xv));
    if abs(xc-xv)<ea+er*abs(xc) %succes
        z=xc;
        ni=k;
        return
    end
    xv=xc; %pregatesc iteratia urmatoare
end
%esec
error('s-a depasit numarul maxim de iteratii')
        
