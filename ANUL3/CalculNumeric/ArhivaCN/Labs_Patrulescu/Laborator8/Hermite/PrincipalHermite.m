clear all
clc
close all

x=linspace(0,6,13);
f=exp(sin(x));
fd=exp(sin(x)).*cos(x);
Al=DiferenteDivizate(x,f);% se calculeaza diferentele divizate
[zh,Ah]=DifDivDuble(x,f,fd);% se calculeaza diferentele divizate pentru noduri duble

u=0:0.05:6;
Exact=exp(sin(u));
Herm=zeros(1,length(u));
Lagr=zeros(1,length(u));
for k=1:length(u)
     Herm(k)=Newton(Ah,zh,u(k));
     Lagr(k)=Newton(Al,x,u(k));
end
 
Erh=abs(Exact-Herm);
Erl=abs(Exact-Lagr); 

figure(1)
hold on
box on
title('Interpolare Hermite cu noduri duble. Metoda Powell')
plot(u,exp(sin(u)),'r')
plot(u,Herm,'b*')

figure(2)
hold on
box on
title('Eroarea pentru interpolarea Hermite')
plot(u,Erh,'b*')

figure(3)
hold on
box on
title('Interpolare Lagrange cu diferente divizate')
plot(u,exp(sin(u)),'r')
plot(u,Lagr,'b*')

figure(4)
hold on
box on
title('Eroarea pentru interpolarea Lagrange')
plot(u,Erl,'b*')
