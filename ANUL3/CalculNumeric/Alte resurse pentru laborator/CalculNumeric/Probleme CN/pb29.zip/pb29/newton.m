function [p] = newton(p0, e, np,Re)
% rezolva ecuatia neliniara in cf (coeficient de frecare) de curgere turbulenta a unui fluid printr-o conducta neteda folosind metoda lui Newton
%Parametrii:
%   p0 = aproximarea initiala
%   e = eroarea
%   np = numarul de pasi
%   Re = valoarea numarului lui Reynolds

for i = 1:np
   p = p0 - f(p0,Re)/df(p0,Re);
   if abs(p-p0) < e 
       return;
   end
   p0 = p;
end

disp(['Precizia nu poate fi atinsa cu numarul dat de iteratii']);