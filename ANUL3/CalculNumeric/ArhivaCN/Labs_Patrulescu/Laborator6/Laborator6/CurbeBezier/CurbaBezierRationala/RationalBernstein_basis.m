clc
close all
clear all

n=3;
w=[1,3,7,1];
h=0.01;
t=0:h:1;


for i=1:n+1
   y(i,:)=RationalBernstein_ni(t,w,n,i);%Bernstein_ni(t,n,i);
end

figure(1)
hold all
box on
plot(t,y)

