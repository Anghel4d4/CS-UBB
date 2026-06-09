format long
x=1.0;
I=intRomberg(@(t)J_0(x,t),0,pi,1e-4)
besselj(0,x)


x=2.0;
I=intRomberg(@(t)J_0(x,t),0,pi,1e-4)
besselj(0,x)


x=3.0;
I=intRomberg(@(t)J_0(x,t),0,pi,1e-4)
besselj(0,x)

