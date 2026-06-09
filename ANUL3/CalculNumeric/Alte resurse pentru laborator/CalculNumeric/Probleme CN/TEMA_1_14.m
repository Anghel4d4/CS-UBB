% Daraban Cristian - Adrian
% Grupa 232
% Problema 1.14(sinus)
% calc in radiani sin x
clc;
x = linspace(-pi, pi);
%x= 28*pi/3:40*pi/3;

r = calcSin(x);
err = norm(sin(x) - r)

subplot(1,2,1);
plot(x, r, '-r.');
subplot(1,2,2);
plot(x, sin(x), '.');
