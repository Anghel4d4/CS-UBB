function ODE_IVP

clear all
clc
close all

global lambda y0

tipex='ex1';
lambda=2;
y0=1;


x=0:0.05:2;
Sol_ex=exact(x,tipex);


y=EulerExplicita(x,y0,tipex);
z=Runge(x,y0,tipex);

[w1,w2]=AB2(x,y0,tipex);

EroareEe=abs(y-Sol_ex);
EroareR=abs(z-Sol_ex);

EroareAB2Ee=abs(w1-Sol_ex);
EroareAB2R=abs(w2-Sol_ex);
    
figure(1)
hold on
box on
title('Metode numerice pt ODE-IVP')
plot(x,Sol_ex,'Color','r','LineWidth',1.5)
plot(x,y,'b*')
plot(x,z,'go')
legend('Exact','Euler-explicit','Runge')

figure(2)
hold on
box on
title('Erorile de aproximare pt ODE-IVP')
plot(x,log10(EroareEe),'Color','b','LineWidth',1.5)
plot(x,log10(EroareR),'Color','g','LineWidth',1.5)
legend('Euler-explicita','Runge')


figure(3)
hold on
box on
title('Metode numerice pt ODE-IVP')
plot(x,Sol_ex,'Color','r','LineWidth',1.5)
plot(x,w1,'b*')
plot(x,w2,'go')
legend('Exact','AB2-Euler-ex','AB2-Runge')

figure(4)
hold on
box on
title('Erorile de aproximare pt ODE-IVP')
plot(x,log10(EroareAB2Ee),'Color','b','LineWidth',1.5)
plot(x,log10(EroareAB2R),'Color','g','LineWidth',1.5)
legend('AB2-Euler-ex','AB2-Runge')

