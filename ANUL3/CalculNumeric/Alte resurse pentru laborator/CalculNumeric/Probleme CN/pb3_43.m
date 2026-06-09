clc
x=[5.0,7.5,9.9,12.9,13.2,15.1,16.3,16.8];
y=[0.0240,0.0437,0.0797,0.1710,0.1990,0.3260,0.8460,0.9720];
dCo=derivate(y);
D=zeros(1,length(y));
for i=1:length(y)
    D(i)= y(i)+i*y(i)/dCo(i);
end
xi=linspace(0,3*pi/2,200);
yi=splineNat(x,D,xi);
plot(x,y,'*',xi,yi,'-')