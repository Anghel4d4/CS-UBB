% function I=SimpsonInt(f,a,b,n);
% %f - functia
% %a, b - limitele intervalului de integrare
% %n - numarul de puncte: x1, x2,...xn
% 
% h=(b-a)/n;
% x2=[1:n-1]*h+a;
% x4=[0:n-1]*h+a+h/2;
% I=h/6*(f(a)+f(b)+2*sum(f(x2))+4*sum(f(x4)));

function I = SimpsonInt(f,a,b,N)
x = linspace(a,b,N+1);
I = (b-a)/(3*N) * (f(a) + f(b) + 2*sum(f(x(3:2:N))) + 4*sum(f(x(2:2:N))));