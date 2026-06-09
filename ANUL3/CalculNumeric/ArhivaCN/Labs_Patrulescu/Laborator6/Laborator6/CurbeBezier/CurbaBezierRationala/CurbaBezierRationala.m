function CurbaBezierRationala

clc
close all
clear all

Bx=[1,1,0];%puncte de control
By=[0,1,1];
w=[1,1,2];

h=0.01;
t=0:h:1;%domeniul pentru polinoame Bernstein rationale

n=length(Bx)-1;% gradul polinoamelor Bernstein rationale
nt=length(t);


Px=zeros(1,nt); Py=zeros(1,nt);

for k=1:nt 
     for i=1:n+1% se calculeaza curba Bezier rationala
         Int=RationalBernstein_ni(t(k),w,n,i);
         Px(k)=Px(k)+Bx(i)*Int;
         Py(k)=Py(k)+By(i)*Int;
     end
     
end

figure(1)
hold on
box on
axis([min(Bx)-0.15 max(Bx)+0.15 min(By)-0.15 max(By)+0.15])
plot(Bx,By,'g*')
plot(Bx,By,'b')
plot(Px,Py,'r')


