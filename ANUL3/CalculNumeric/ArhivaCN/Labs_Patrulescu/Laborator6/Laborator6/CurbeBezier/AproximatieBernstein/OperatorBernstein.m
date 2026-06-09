function [rez]=OperatorBernstein(x,tipex,m)
%x-punctul in care se aproximeaza functia
%tipex-tipul exemplului
%m-gradul polinoamelor Bernstein
%returneaza valoarea operatorului Bernstein in punctul x

xe=linspace(0,1,m);
Fe=f(xe,tipex);

Be=zeros(1,m);
for k=1:m
Be(k)=Bernstein_ni(x,m,k);
end

rez=sum(Fe.*Be);