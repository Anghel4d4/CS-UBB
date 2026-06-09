% Precizia creste liniar odata cu scaderea tolerantei
% Numarul de evaluari creste exponential odata cu scaderea tolerantei

clc

f=@(x)2./(1+x.^2);

global nEval

format long

nTests=5;

x=zeros(1,nTests);
y1=zeros(1,nTests);
y2=zeros(1,nTests);

for i=1:nTests
    nEval = 0;
    
    tol=1/(10^(nTests-i+2))
    x(i)=tol;
    
    I=intAdapt(f,-1,1,tol)
    
    precizie=abs(I-pi)
    y1(i)=precizie;
    
    nEval
    y2(i)=nEval;
end

subplot(2, 1, 1)
plot(x,y1)
title('Evolutia erorii')
xlabel('Toleranta')
ylabel('Eroare')

subplot(2, 1, 2)
plot(x,y2)
title('Evolutia numarului de evaluari')
xlabel('Toleranta')
ylabel('Evaluari')