function Z=prodtens(u,v,x,y,f)
%prodtens - interpolant Lagrange produs tensorial
%apel [Z,X,Y]=prodtens(u,v,x,y,f)
%u - abscise pt evaluare
%v - ordonate pt evaluare
%x - abscise noduri
%y - ordonate noduri
%f - functia

[X,Y]=meshgrid(x,y);
F=f(X,Y);;
lu=pfl2b(x,u)';
lv=pfl2b(y,v);
Z=lu*F*lv;
