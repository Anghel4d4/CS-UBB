% :[0,2*pi]->R
% f(x)=sin(sqrt(101*x)) + cos(sqrt(37*x))
% xk - Cebisev de speta a doua
% n=10 (11 noduri)
% metoda baricentrica (PIL)
% forma Netwon (PIL)
% polinomul de interpolare hermite cu noduri duble
% spline cubic
% metoda celor mai mici pătrate (8 noduri)
f=@(x)sin(sqrt(101*x))+cos(sqrt(37*x));
fd=@(x)sqrt(101)*cos(sqrt(101*x)-sqrt(37)*sin(sqrt(37)*x);
m=10;
k=0:m;
x=cos(k*pi/m);
t=(2*pi*x+2*pi)/2;
y=f(t);
tg=linspace(0,2*pi,500);
ft=f(tg);
B=metBaricentrica(t,y,tg);
figure
plot(t,fg,'o',tg,B,'-',tg,ft);
title("Problema Baricentrica");
%Ba=metBaricentrica(xk,fg,ta);
%plot(xk,f,'o',xk,f,fg,Ba,'-');
%N=metNewton(x,f,ta);
%plot(x,f,'o',xg,fg,ta,N,'-');





