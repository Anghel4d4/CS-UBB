function [x,ni] = Newton(a,b,x0,ea,er,niMax)
% metoda lui Newton pentru ecuatii neliniare in R si R^n
% se apeleaza: [x,ni] = Newton(a,b,x0,ea,er,nmax)
% a - functia pentru care se cauta radacini
% b - derivata functiei
% x0 - aproximatia initiala 
% ea - eroarea absoluta
% er - eroarea relativa
% niMax - numarul maxim de iteratii
% x - aproximatia radacinii
% ni - numarul de iteratii

if nargin < 6
	niMax = 50; 
end
if nargin < 5 
	er = 0; 
end
if nargin < 4 
	ea = 1e-3; 
end
xn = x0(:);
for iteratie = 1:niMax 
	xnPlusUnu = xn - feval(b,xn)\feval(a,xn); 
	if norm(xnPlusUnu - xn,inf) < ea + er*norm(xnPlusUnu,inf)
		x = xnPlusUnu;
		ni = iteratie;
		return
	end
	xn = xnPlusUnu;
end
error('S-a depasit numarul maxim de iteratii');
