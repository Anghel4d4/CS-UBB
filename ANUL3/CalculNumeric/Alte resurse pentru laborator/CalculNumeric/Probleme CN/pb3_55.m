n=10;
x=linspace(-5, 5, n);
y=zeros(1,n);
for i=1:length(x)
   y(i)=1\(1+x(i)^2); 
end
yd=zeros(1,n);
for i=1:length(x)
   yd(i)=-2*x(i)\((1+x(i)^2)^2); % y'(x)=-2*x/(1+x^2)^2
end

xa=linspace(-5, 5, n);
ya=interpHermite(x,y,yd,xa);

xb=cos((2*(1:n)-1)*pi/2/n);
yb=interpHermite(x,y,yd,xb);

xc=cos((1*(1:n+1)-1)*pi/n);
yc=interpHermite(x,y,yd,xc);

plot(x,y,'o',xa,ya,'r',xb,yb,'b',xc,yc,'g');