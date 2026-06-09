function [A]=sistem(x)
%Aici este sistemul ,reprezentat de matricea A

A(1)=2*x(1)^2-x(1)+x(2)^2-x(3);
A(2)=32*x(1)^2-x(2)^2+20*x(3);
A(3)=x(2)^2-14*x(1)*x(3);