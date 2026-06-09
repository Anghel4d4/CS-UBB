N=100;
a=0;
b=pi/2;
alfa=1;
beta=1;
p = @(x) 0;
q = @(x) -1;
r = @(x) 0;
[x,y] = probl_bilocala(a,b,N,alfa,beta,p,q,r);
plot(x,y,'-');
x
y