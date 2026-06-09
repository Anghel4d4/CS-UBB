function fi=lagr2(x,y,xi)
%LAGR2 - calculeaza polinomul de interpolare Lagrange
%cu polinoame fundamentale
% x,y -coordonatele nodurilor
% xi - punctele in care se evalueaza polinomul

if nargin ~=3 
error('numar ilegal de argumente')
end
z=pfl(x,xi);
fi=y*z;
