close all
clear all
clc


global m

m=5;
x=0:0.01:2;
h=x(2)-x(1);
tipex='ex1';
Ex=exact(x,tipex);%determinarea solutiei exacte

n=length(x);
b(1:n,1)=h^2*f(x,tipex);%vectorul termenilor liberi

d=[1,2*ones(1,n-2),1];%vectorii pentru algoritmul Thomas
ds=[0,-ones(1,n-2),0];
di=[0,-ones(1,n-2),0];


tic
y=AlgThomas(d,ds,di,b);%rezolvarea sistemului folosind algoritmul Thomas
toc

figure(1)
hold on
box on
plot(x,Ex,'b')
plot(x,y,'r*')


figure(2)
hold on
box on
title('Eroarea de aproximare-metoda cu diferente centrate')
plot(x,log10(abs(Ex-y)),'r*')