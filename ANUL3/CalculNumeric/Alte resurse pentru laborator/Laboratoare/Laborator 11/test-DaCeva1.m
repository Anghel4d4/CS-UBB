% :[0,2*pi]->R
% f(x)=sin(sqrt(101*x)) + cos(sqrt(37*x))
% xk - Cebisev de speta a doua
% n=10 (11 noduri)
% metoda baricentrica (PIL)
% forma Netwon (PIL)
% polinomul de interpolare hermite cu noduri duble
% spline cubic
% metoda celor mai mici pătrate (8 noduri)
m=10;
k=0:m;
a=0;
b=(2*pi);
xk=cos((k*pi)/m);
%c=(a+b)/2;
f=sin(sqrt(101*xk))+cos(sqrt(37*xk));
tk=((b-a)*xk+(a+b))/2;
ta=a:0.01:b;
%xg=1:0.004:1;
%y=f(tk);
%ta=((b-c)*x+(a+b))/2;
fg=(sin(sqrt(101*tk))+cos(sqrt(37*tk))).^(-1);
%fa=(sin(sqrt(101*ta))+cos(sqrt(37*ta))).^(-1);
%Ba=metBaricentrica(xk,fg,ta);
%plot(xk,f,'o',xk,f,fg,Ba,'-');
B=metBaricentrica(xk,fg,tk);
plot(xk,f,'o',xk,f,fg,Ba,'-');
%N=metNewton(x,f,ta);
%plot(x,f,'o',xg,fg,ta,N,'-');




