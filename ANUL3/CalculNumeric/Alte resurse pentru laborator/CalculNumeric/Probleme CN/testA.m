clc;
alfa=(sqrt(2)-1)/10;
beta=10;
format long
syms x;
K2=beta^2*sqrt(1-alfa^2*beta^2);
I=4*pi*alfa*int(sqrt(1-K2*x^2), x, 0, 1/beta);

eval(I)