
clear all
clc
close all

x=linspace(0,6,13);
f=exp(sin(x));
A=DiferenteDivizate(x,f);

z=0:0.05:6;
for k=1:length(z)
    New(k)=Newton(A,x,z(k));
end

figure(1)
hold on
box on
plot(z,exp(sin(z)),'r')
plot(z,New,'b*')