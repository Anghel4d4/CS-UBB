% ~~ Problema 22.2 ~~ 
%                               Pop Cornel Gr.232
%
%   In unele probleme de distributie a temperaturii este necesar sa se 
% gaseasca radacinile pozitive ale ecuatiei:
%          2*X*J1(x) - J0(x) = 0
% unde J0(x) si J1(x) sunt functiile Bessel de speta I de ordinul 0 si 1.
%   Calculati cele mai mici 3 radacini pozitive.

clc
clear

disp('Toate solutiile sunt:');
ToateSolutiile = fsolve(@func,[1 -1 3],optimset('Display','iter'))
Lungime = length(ToateSolutiile);
disp('Lungimea vectorului rezultat este: ');
disp(Lungime);
disp('Cele mai mici 3 radacini pozitive sunt: ');

for i=1:Lungime 
    if ToateSolutiile(i)>=0
        x = ToateSolutiile(i);
        x
    end
end
