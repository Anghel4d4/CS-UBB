function CurbaBezier

clc
close all
clear all

Bx=[1,2,5,7,11];%puncte de control
By=[1,3,-1,1,5];

h=0.01;
t=0:h:1;%domeniul pentru polinoame Bernstein

n=length(Bx)-1;% gradul polinoamelor Bernstein
nt=length(t);


Px=zeros(1,nt); Py=zeros(1,nt);
C1=zeros(1,nt); C2=zeros(1,nt);
for k=1:nt 
     for i=1:n+1% se calculeaza curba Bezier folosind definitia clasica
         Px(k)=Px(k)+Bx(i)*Bernstein_ni(t(k),n,i);
         Py(k)=Py(k)+By(i)*Bernstein_ni(t(k),n,i);
     end
     [C1(k),C2(k)]=deCasteljau(t(k),Bx,By);% se calculeaza valoarea curbei Bezier in t(k) folosind algoritmul deCasteljau
end

figure(1)
hold on
box on
plot(Bx,By,'g*')
plot(Bx,By,'b')
plot(Px,Py,'r')

figure(2)
hold on
box on
plot(Bx,By,'g*')
plot(Bx,By,'b')
plot(C1,C2,'k')

figure(3)
hold on
box on
plot(Px,Py,'ro')
plot(C1,C2,'k*')
