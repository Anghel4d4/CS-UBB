%plot&subplot
clc;
x = linspace(0,10);
y1 = x;
y2 = 3/2*x.^2-1/2;
y3 = 5/2*x.^3-3/2*x;
y4 = 35/8*x.^4-15/4*x.^2+3/8;

figure 

subplot(2,2,1);
plot(y1);
subplot(2,2,2);
plot(y2);
subplot(2,2,3);
plot(y3);
subplot(2,2,4);
plot(y4);
