clc
x=linspace(-1,1,200);
y=-2*x.^3+4*x.^2-x+5;
y=y+normrnd(0,0.5,1,200);
co=polyfit(x,y,3);
yo=polyval(co, x);
subplot(1,2,1)
plot(x,y,'*',x,yo,'-r')
disp(co)
c1=mypolyfit(x,y,3);
y1=polyval(c1,x);
subplot(1,2,2)
plot(x,y,'.',x,y1,'-r')
disp(c1)