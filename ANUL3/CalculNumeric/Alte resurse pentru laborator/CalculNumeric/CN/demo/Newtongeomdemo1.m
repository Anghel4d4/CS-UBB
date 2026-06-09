%NEWTONGEOMDEMO1 - demonstratie cu Newton -geometric
x0=2;
f=@(x) x.^3-x-1;
df=@(x) 3*x.^2-1;
a=1; b=2; n=3;
newtongeom(x0,f,df,a,b,n)