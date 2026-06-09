clc
n = 20;
x = linspace(-pi, pi, n);
y = sin(3*pi)+normrnd(0, 0.2, 1 ,n);
xi = linspace(-pi, pi, 200); % 200 de puncte
%plot(x, y, '*')
cp = polyfit(x, y, n-1);
yi = polyval(cp, xi);
plot(x, y, '*', xi, yi, '-')
