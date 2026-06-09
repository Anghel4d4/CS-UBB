function y=EulerExplicita(x,y0,tipex)
%implementeaza metoda Euler explicita cu pas constant pentru punctele x si valoarea de start y0


n=length(x);%numarul de puncte din discretizare
h=x(2)-x(1);%pasul (in acest caz avem pas constant intre doua puncte consecutive)

y=zeros(1,n); y(1)=y0; 

for i=1:n-1
  y(i+1)=y(i)+h*f(x(i),y(i),tipex);
end