# Problema 3
# Desenați o curbă spline cubică parametrică ce trece printr-o mulțime de puncte date.

[x,y]=ginput();
n=length(x);
tn=0:n-1;
tg=linspace(0,n-1,1000);
xg=spline(tn,x,tg);
yg=spline(tn,y,tg);
plot(x,y,'o',xg,yg);