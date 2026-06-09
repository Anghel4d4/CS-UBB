%P4_7
%s-a ales ca exemplu
%y''-p(x)y'-q(x)y=r(x)
%a=1, b=2; alfa=1, b=2;
%N=9;
%p(x)=-2/x; q(x)=2/x^2; r(x)=sin(ln(x))/x^2;
%solutia exacta 

p=@(x) -2./x;
q=@(x) 2./x.^2;
r=@(x) sin(log(x))./x.^2;
a=1; b=2;
alfa=1; bet=2; 
N=9;
[x,y]=bilocal(p,q,r,a,b,alfa,bet,N);
[x2,y2]=bilocalsim(p,q,r,a,b,alfa,bet,N);
c2=1/70*(8-12*sin(log(2))-4*cos(log(2)));
c1=11/10-c2;
ye=c1*x+c2./x.^2-3/10*sin(log(x))-1/10*cos(log(x));
plot(x,y,x,ye,x2,y2)