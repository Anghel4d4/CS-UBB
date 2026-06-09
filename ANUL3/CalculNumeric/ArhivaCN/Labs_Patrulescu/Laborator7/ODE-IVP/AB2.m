function [w1,w2]=AB2(x,y0,tipex)
%functie care implementeaza metoda Adams-Bashforth de ordin 2 cu pas
%constant, folosind metodele Euler explicita si Runge pentru a calcula valorile de start

n=length(x);%numarul de puncte din discretizare
h=x(2)-x(1);%pasul (in acest caz avem pas constant intre doua puncte consecutive)

w1=zeros(1,n); w1(1)=y0; w1(2)=w1(1)+h*f(x(1),w1(1),tipex);
w2=zeros(1,n); w2(1)=y0; w2int=w2(1)+0.5*h*f(x(1),w2(1),tipex);w2(2)=w2(1)+h*f(x(1),w2int,tipex);

for i=2:n-1
  w1(i+1)=w1(i)+0.5*h*(3*f(x(i),w1(i),tipex)-f(x(i-1),w1(i-1),tipex));
  w2(i+1)=w2(i)+0.5*h*(3*f(x(i),w2(i),tipex)-f(x(i-1),w2(i-1),tipex));
end