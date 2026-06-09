clc
clear all
close all

x=[1,2,3,4,5,6,7];
y=[13,15,20,14,15,13,10];
n=length(x);

[b1,b0,Vmin]=MCMMP_Liniar(x,y);
p=polyfit(x,y,1);

fprintf('Coeficientii pt cazul liniar: %.5f,\t%.5f\n',b0,b1)
fprintf('Coeficientii pt cazul liniar folosind functia polyfit: %.5f,\t%.5f\n',p(2),p(1))
xint=min(x):0.1:max(x);
Phi=b0+b1*xint;





figure(1)
hold on
box on
axis([min(x)-0.1 max(x)+0.1 min(y)-0.1 max(y)+0.1])
plot(x,y,'ro','MarkerFaceColor','r')
plot(xint,Phi,'Color','blue','LineWidth',4)

for i=1:length(x)
line([x(i), x(i)],[y(i) b0+b1*x(i)],'Color','g','LineWidth',3)
end

