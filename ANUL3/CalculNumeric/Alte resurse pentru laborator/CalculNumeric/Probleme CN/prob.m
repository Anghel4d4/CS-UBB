
clear all;
clc;
close all;

h = 0.1;
c = 40:h:230;
plot(c,g1(c),'b',c,c + 15.24,'r');
title('g1(c) si c + 15.24');
xlabel('c');
ylabel('functie(c)');

% aflam c pentru care c + 15.24 = c*cosh(152.4/2/c)
% formam functia g2 = c*cosh(152.4/2/c) - 15.4 - c;
% daca acest punct este unic atunci tensiunea maxima in fir
% este data de ecuatia a doua unde c este punctul tocmai aflat.
% folosim metoda falsei pozitii 

a_n = 40;
b_n = 230;
k = 0;
err_ = 1e-3;
er = abs(a_n-b_n);
nr_max = 100;

while k < nr_max && er > err_
    k = k + 1;
    
    x = a_n - (a_n - b_n)/(g2(a_n) - g2(b_n))*g2(a_n);
    
    er = min(abs(a_n - x),abs(b_n - x));
    
    if g2(a_n)*g2(x) > 0
        a_n = x;
        b_n = b_n;
    else
        a_n = a_n;
        b_n = x;
    end
end
hold on
plot(x,g1(x),'*g');
x
k

disp('tensiunea maxima in fire este: ');
T = 0.770869229*(x + 15.24)




