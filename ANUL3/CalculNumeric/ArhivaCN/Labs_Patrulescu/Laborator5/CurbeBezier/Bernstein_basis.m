clc
close all
clear all
n=5;
h=0.05;
t=0:h:1;


for i=1:n+1
   y(i,:)=Bernstein_ni(t,n,i);
end

figure(1)
hold all
box on
plot(t,y)
for i=1:n+1
    plot((i-1)/n,Bernstein_ni((i-1)/n,n,i),'b*');%determina maximul
end



