%x=linspace(-pi,pi);
%y1=sin(x);
%y2=cos(x);
%[tsin, tcos]=aproxSinCos(x,1e-5);
%plot(x,y1,'.',x,y2,'.',x,tsin,'-',x,tcos,'-')
%legend('sin','cos','tsin','tcos');
%(2pi)^180/180!
[tsin, tcos, k]=aproxSinCos(20*pi,1e-5)