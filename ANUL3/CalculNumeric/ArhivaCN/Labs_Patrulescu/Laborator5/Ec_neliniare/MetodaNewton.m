function MetodaNewton
clear all
clc
close all

Nmax=1000;

count=1;
x0=2.1;
epsilon=10^(-10);

while count<Nmax
    
    x1=x0-f(x0)/fderiv(x0);
    count=count+1;
    if norm(x1-x0,Inf)<epsilon
       break
    end
    x0=x1;
end
count
x1
    
f(x1)
    