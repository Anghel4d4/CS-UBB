function y=approxLegendre(f,x,n)
%APPROXLEGENDRE - aproximare continua mcmmp Legendre
%apel y=approxLegendre(f,x,n)
%f - functia
%x - punctele
%n - gradul

c=coeffLegendre(f,n);
y=evalaprLegendre(c,x);
