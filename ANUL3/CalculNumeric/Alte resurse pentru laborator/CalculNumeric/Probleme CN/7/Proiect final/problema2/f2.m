function [A]=f2(x)
%Sistemul caruia trebuie sa-i gasesc solutiile

A(1)=9*x(1)^2+36*x(2)^2+4*x(3)^2-36;
A(2)=x(1)^2-2*x(2)^2-20*x(3);
A(3)=x(1)^2-x(2)^2+x(3)^2;