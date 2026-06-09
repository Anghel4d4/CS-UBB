function I=trapez(f,a, b,n);
%TRAPEZ formula trapezelor
%apel I=trapez(f,a,b,n);
h=(b-a)/n;

suma = 0;
for (i = 1:n-1)
    suma = suma + feval(f, i*h + a);
end

I = (feval(f,a)+feval(f,b) + 2 * suma)*h/2;

