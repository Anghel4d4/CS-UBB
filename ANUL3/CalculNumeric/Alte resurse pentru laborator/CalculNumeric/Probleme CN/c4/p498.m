clc

R = 6371 * 10^3;
g = 9.79881;

f = @(z) z .^(-2);

% pentru a realiza aproximarea, vom integra prin metoda Romberg
% de la 1 la x, unde x va lua valoarea primelor 7 puteri ale lui 10
% (deoarece se constata ca pentru 10^7, integrala are valoarea 1)

for x = 1:1:7
    I = intRomberg(f, 1, 10^x, 1e-5);
    v = sqrt(2*g*R*I);
    fprintf('Aproximare cu integrala de la 1 la 10^%d (avand valoarea %f): %f m/s^2\n', x, I, v)    
end