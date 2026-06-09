%Problema 3.53. Constanta lui Euler gamma = 0:57721566490153286...se de?neste ca limita
% gamma = lim (n->inf) gammaN, unde gammaN = 1 + 1/2 + 1/3 + ... + 1/n - ln(n).
%Presupunand ca gamma - gammaN ~= c*n^(-d), n->inf, pentru constantele c si d strict pozitive, 
%determinati c si d experimental pe calculator. 
%(Indicatie: logaritmati relatia gamma - gammaN ~= c*n^(-d) si aplicati metoda celor mai mici patrate). 

clc
gamma0 = 0.57721566490153286;
%valori_n = 10000:1000:100000;
valori_n = 1e6:1e5:1e7;
dif = zeros(1,length(valori_n));

for i = 1:length(valori_n)
    n = valori_n(i);
    dif(i) = sum(1./(1:n)) - log(n) - gamma0;
end

coef = polyfit1(log(valori_n),log(dif),1);
d = -coef(1);
c = exp(coef(2));
fprintf('c=%g, d=%g\n', c, d)

yFit = c*valori_n.^(-d);
plot(valori_n, dif, 'o', valori_n,yFit)
%plot(log(valori_n), log(dif), 'o', log(valori_n),polyval(coef,log(valori_n)))