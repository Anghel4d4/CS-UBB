i=-2:2;
e=zeros(11,4);
r=zeros(1,10);
for n=1:4
    for k=0:10
h=1/4*2^(-k);
f=func(i*h);
df1=f(4)-f(3);
d2f1=f(4)-2*f(3)+f(2);
d3f2=f(5)-3*f(4)+3*f(3)-f(2);
d4f2=f(5)-4*f(4)+6*f(3)-4*f(2)+f(1);
delta=[df1 d2f1 d3f2 d4f2];
fder=[pi 2*pi^2 2*3*pi^3 2*3*4*pi^4];
e(k+1,n)=fder(n)-1/(h^n)*delta(n);
if k>=1
    r(k)=abs(e(k+1,n)/e(k,n));
end
    end
figure(n)    
plot(1:11,e(:,n))
title('e_n')
figure(n+4)
plot(1:10,r)
title('r_k')
end

%din figurile alaturate se observa ca onvergenta este de ordin exponential