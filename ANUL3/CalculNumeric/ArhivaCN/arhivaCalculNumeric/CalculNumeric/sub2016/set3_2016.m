F=@(x) (1+x)/(1+exp(x));

f=@(x) x.*exp(x)-1;
opt=optimset('Display','iter','tolx',1e-10);
x0=0.4;
fzero(f,0.4,opt)
x1=F(x0); k=0;
while abs(x1-x0)>=1e-10
  x0=x1;
  x1=F(x0); k=k+1;
  display([k,x1,abs(x1-x0)]);
end
x0=0.2;
x1=exp(-x0); k=0;
while abs(x1-x0)>=1e-10
  x0=x1;
  x1=exp(-x0); k=k+1;
  display([k,x1,abs(x1-x0)]);
end