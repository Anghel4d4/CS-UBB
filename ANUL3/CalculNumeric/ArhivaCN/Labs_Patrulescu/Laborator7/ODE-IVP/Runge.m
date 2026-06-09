function z=Runge(x,y0,tipex)
% functie care implementeaza metoda Runge cu pas constant pentru punctele x
% si valoarea de start y0

n=length(x);%numarul de puncte din discretizare
h=x(2)-x(1);%pasul (in acest caz avem pas constant intre doua puncte consecutive)


z=zeros(1,n); z(1)=y0;
for i=1:n-1
  zint=z(i)+0.5*h*f(x(i),z(i),tipex);
  z(i+1)=z(i)+h*f(x(i),zint,tipex); 
end