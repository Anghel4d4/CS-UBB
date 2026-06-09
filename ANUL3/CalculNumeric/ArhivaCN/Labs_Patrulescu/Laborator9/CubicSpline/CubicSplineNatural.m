clc
clear all
close all

x=0:1:3;
y=f(x);

n=length(x);
A=zeros(n,n);
rt=zeros(1,n);
h=diff(x);
a=y;
b=zeros(1,n);
d=zeros(1,n);

A(1,1)=1; A(n,n)=1;
rt(1)=0; rt(n)=0;
for i=2:n-1
 A(i,i)=2*(h(i-1)+h(i));
 A(i,i-1)=h(i-1);
 A(i,i+1)=h(i);
 rt(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1));
end
rt=rt';
c=A\rt;
c=c';
for j=1:n-1
    b(j)=1/h(j)*(a(j+1)-a(j))-h(j)/3*(2*c(j)+c(j+1));
    d(j)=(c(j+1)-c(j))/(3*h(j));
end

Coef=[d' c' b' a']

figure(1)
hold on
box on

for i=1:n-1
    
  z=x(i):h/10:x(i+1);
  P=[d(i),c(i),b(i),a(i)];
  val=polyval(P,z-x(i));
  hold on
  plot(z,val,'g');
end


plot(x,y,'b*')


