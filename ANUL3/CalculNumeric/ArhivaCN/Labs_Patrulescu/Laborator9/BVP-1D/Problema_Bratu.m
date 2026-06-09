clear all
close all
clc


x=0:0.01:1;
Cc=3.513830719;
tc=4.79871456;
epsilon=10^(-6);
Nmaxit=100;
Ex=-2*log(cosh((x-0.5)*tc/2)/cosh(tc/4));
h=x(2)-x(1);

n=length(x);


d=[1,2*ones(1,n-2),1];%vectorii pentru algoritmul Thomas
ds=[0,-ones(1,n-2),0];
di=[0,-ones(1,n-2),0];

uold=zeros(1,n);
unew=zeros(1,n);
rhsold=h^2*Cc*exp(uold);

it=0;
while (it<Nmaxit)
it=it+1;
unew=AlgThomas(d,ds,di,rhsold);
if norm(unew-uold,'inf')<=epsilon
  break
end
uold=unew;
rhsold=h^2*Cc*exp(uold);
end
it
figure(1)
hold on
box on
plot(x,unew,'b*')
plot(x,Ex,'r')