function rez = cosTaylor(x, eroare)
% x^(2*n) / (2n)! , se impart 2 numere foarte mari si trebuie sa se obtina
% un numar foarte mic => se pierde precizie la calcularea in virgula
% flotanta
% => reducem unghiul x intre -2pi si 2pi
x = mod(x,2*pi);
rez = 0;
n = 0;
termen = 1;
while abs(termen) > eroare
    rez = rez + termen;
    n = n + 1;
    termen = termen*(-1)*(x^2)/((2*n-1)*(2*n));
end