function CurbaBezier

clc
close all
clear all

h=0.01;
t=0:h:1;
Bx=[1,2,5,7,11];
By=[1,3,4,1,5];
n=length(Bx)-1;% gradul polinoamelor Bernstein
nt=length(t);

Px=zeros(1,nt); Py=zeros(1,nt);
for k=1:nt 
     for i=1:n+1
         Px(k)=Px(k)+Bx(i)*Bernstein_ni(t(k),n,i);
         Py(k)=Py(k)+By(i)*Bernstein_ni(t(k),n,i);
     end
end

figure(1)
hold on
box on
plot(Bx,By,'g*')
plot(Bx,By,'b')
plot(Px,Py,'r')
