function [x]=hermite(a1,b1,a2,b2,t)
x=(2*a1-2*a2+b1+b2)*t*t*t+(-3*a1+3*a2-2*b1-b2)*t*t+b1*t+a1;