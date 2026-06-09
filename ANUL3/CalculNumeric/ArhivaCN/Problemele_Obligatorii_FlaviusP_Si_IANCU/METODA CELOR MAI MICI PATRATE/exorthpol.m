k=input('k=');
fp=inline('x+sin(pi*x.^2)');
x=linspace(-1,1,100);
y=fp(x);
yle=approxLegendre(fp,x,k);
ycc=approxChebyshev(fp,x,k);
ycd=approxChebyshevdiscr(fp,x,k);
plot(x,y,':', x,yle,'--', x,ycc,'-.',x,ycd,'-');
legend('f','Legendre', 'Cebisev continuu', 'Cebishev discret',4)
title(['k=',int2str(k)],'Fontsize',14);
cl=coeffLegendre(fp,k)
ccc=coeffChebyshev(fp,k)
ccd=coeffChebyshevdiscr(fp,k)
