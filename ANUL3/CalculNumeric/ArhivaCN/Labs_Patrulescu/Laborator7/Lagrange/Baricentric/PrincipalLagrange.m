function PrincipalLagrange
clear all
close all
clc

a=0;% capetele intervalului
b=2*pi;
nx=21;

pasz=0.01;

x=linspace(a,b,nx);% se genereaza punctele echidistante in intervalul [a,b]
y=fL(x);% se calculeaza valori y_i, corespunzatoare nodurilor x_i, folosnd functia fL

xc=Cebisev(a,b,nx);
yc=fL(xc);

z=a:pasz:b;
nz=length(z);
fz=fL(z);

L=Lagrange(z,x);
Lc=Lagrange(z,xc);


Aproxbar=zeros(1,nz); Aproxbarc=zeros(1,nz);
 for k=1:nz
Aproxbar(k)=LagrangeBaricentric(z(k),x,y);
Aproxbarc(k)=LagrangeBaricentric(z(k),xc,yc);
 end


figure(1)
hold on
box on
title('Polinoame Lagrange folosind noduri echidistante')
plot(x,zeros(1,nx),'r*')
plot(z,L(1:nx,:))

figure(2)
hold on
box on
title('Polinomul Lagrange cu noduri echidistante')
plot(x,y,'r*')
plot(z,Aproxbar,'g')
plot(z,fz, 'Color','k')
legend('Valori noduri','Polinomul Lagrange','Functia')

figure(3)
hold on
box on
title('Polinoame Lagrange folosind noduri Cebisev')
plot(x,zeros(1,nx),'r*')
plot(z,Lc(1:nx,:))

figure(4)
hold on
box on
title('Polinomul Lagrange cu noduri Cebisev')
plot(xc,yc,'r*')
plot(z,Aproxbarc,'g')
plot(z,fz, 'Color','k')
legend('Valori noduri','Polinomul Lagrange','Functia')



