% Calculati cu o metoda similara celei din problema precedenta, aproximand 
% de aceasta data aria cercului unitate printr-un sir de arii de trapeze, 
% asa cum se arata ?n ?gura 1.4

clc
n = 1;
f11Eps =  -1/sqrt((1-eps^2)^3);
Rnf = (-1/(12*n^2))*f11Eps;
while Rnf > eps
    n = 2*n;
    Rnf = -1/(12*n^2)*f11Eps;
end
suma = 0;
for k=1:(n-1)
    suma = suma + sqrt(1-(k/n)^2);
end
aproxintfx = 1/(2*n)*(1+2*suma+0)+Rnf;
aproxpi = 4*aproxintfx;
disp(n);
disp(aproxpi);