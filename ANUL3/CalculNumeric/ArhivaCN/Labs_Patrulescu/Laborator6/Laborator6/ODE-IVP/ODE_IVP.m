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


n=length(x);%numarul de puncte din discretizare
h=x(2)-x(1);%pasul (in acest caz avem pas constant intre doua puncte consecutive)

y=zeros(1,n); y(1)=y0; 
z=zeros(1,n); z(1)=y0;
for i=1:n-1
  y(i+1)=y(i)+h*f(x(i),y(i),tipex);%metoda Euler explicita
  zint=z(i)+0.5*h*f(x(i),z(i),tipex);
  z(i+1)=z(i)+h*f(x(i),zint,tipex); %metoda Runge
end

EroareEe=abs(y-Sol_ex);
EroareR=abs(z-Sol_ex);
    
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
