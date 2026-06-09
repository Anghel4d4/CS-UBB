f=@(x) exp(x.^3);
f2=@(x) cos(x.^2);

%romberg
[I,nfev]=Romberg(f,0,1,1e-8,100)

%quadratura
[Q,fcount] = adquad(f,0,1,1e-8)

%quadratura II
[Q3,fcount3] = adquad2(f,0,1,1e-8)




%romberg2
[I2,nfev2]=Romberg(f2,0,pi,1e-8,100)

%quadratura2
[Q2,fcount2] = adquad(f2,0,pi,1e-8)

%quadratura 2 II
[Q4,fcount4] = adquad2(f2,0,pi,1e-8)


integral(f2, 0 ,pi,'abstol',1e-8)