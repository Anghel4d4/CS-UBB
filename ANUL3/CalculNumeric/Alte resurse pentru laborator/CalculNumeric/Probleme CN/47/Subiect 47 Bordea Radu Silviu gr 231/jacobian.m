function [A]=jacobian(x)
%Jacobianul pentru Sistemul dat de ecuatii neliniare
A=zeros(3);

A(1,1)=4*x(1)-1;
A(1,2)=2*x(2);
A(1,3)=-1;

A(2,1)=64*x(1);
A(2,2)=-2*x(2);
A(2,3)=20;

A(3,1)=-14*x(3);
A(3,2)=2*x(2);
A(3,3)=-14*x(1);