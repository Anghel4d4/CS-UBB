clc
close all
clear all


epsilon=10^(-6);
tipex='ex1';
[a,b,exact]=LimiteInterval(tipex);
h=b-a;


 Q1=0.25*h*((f(a,tipex)+2*f(a+h/2,tipex)+f(b,tipex)));

k=1;
while 1&&(k<=100)
    k=k+1;
    S=0;
    for j=1:2^(k-1)
    S=S+f(a+(2*j-1)*h/2^k,tipex);
    end
    Q2=0.5*Q1+h/2^k*S;
    if abs(Q2-Q1)<epsilon
       break
    end
    Q1=Q2;
end
[Q2 exact]
abs(Q2-exact)