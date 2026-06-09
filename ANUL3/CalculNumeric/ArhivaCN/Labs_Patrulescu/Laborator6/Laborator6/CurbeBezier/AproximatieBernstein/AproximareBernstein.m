function AproximareBernstein
clc
clear all
close all

tipex='ex1';
mvect=[11,31,51,101];%gradul polinoamelor Bernstein va fi mvect(k)-1
lm=length(mvect);
x=0:0.01:1;
yB=zeros(lm,length(x));

for k=1:length(mvect)
    for ix=1:length(x)
        yB(k,ix)=OperatorBernstein(x(ix),tipex,mvect(k));
    end
end


figure(1)
hold on
box on
 plot(x,f(x,tipex),'Color','r','LineStyle',':','LineWidth',1.5)
plot(x,yB(1:lm,:))
legend('functia', '11','31','51','101')