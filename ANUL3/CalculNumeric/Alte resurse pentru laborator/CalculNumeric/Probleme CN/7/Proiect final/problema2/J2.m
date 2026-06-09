function [A]=J2(x)
%Jacobianul pentru Sistemul dat de ecuatii neliniare
A=zeros(3);

A(1,1)=18*x(1);
A(1,2)=72*x(2);
A(1,3)=8*x(3);

A(2,1)=2*x(1);
A(2,2)=-4*x(2);
A(2,3)=-20;

A(3,1)=2*x(1);
A(3,2)=-2*x(2);
A(3,3)=2*x(3);