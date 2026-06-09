function [z,ni]=metNewton(f,fd,x0,ea,er,Nmax)
if nargin<6, Nmax=50; end
if nargin<5, er=0; end
if nargin<4, ea=1e-3; end
xv=x0;
for k=1:Nmax
    xc=xv-f(xv)/fd(xv);
    if abs(xc-xv)<ea+er*abs(xc)
        z=xc;
        ni=k;
        return
    end
    xv=xc;
end
error('S-a depasit numarul maxim de iteratii.')
        
