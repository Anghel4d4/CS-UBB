function Z=sumbool(u,v,x,y,f)
%SUMBOOL - interpolant Lagrange suma booleana
%apel [Z,X,Y]=sumbool(u,v,x,y,f)
%u - abscise pt evaluare
%v - ordonate pt evaluare
%x - abscise noduri
%y - ordonate noduri
%f - functia

[X,Y]=meshgrid(x,y);
F=f(X,Y);
[X1,V1]=meshgrid(x,v);
F1=f(X1,V1);
[U2,Y2]=meshgrid(u,y);
F2=f(U2,Y2);
lu=pfl2b(x,u);
lv=pfl2b(y,v);
Z=F1*lu+lv'*F2-lu'*F*lv;
