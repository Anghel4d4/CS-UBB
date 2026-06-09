clc
alfa=(sqrt(2)-1)/10;
beta=10;
K2=beta^2*sqrt(1-alfa^2*beta^2);
f=@(x) (sqrt(1-K2.*x.^2));
format long
[I1,nr1]=adquad(f,0,1/beta,1e-8);
[I2,nr2]=Romberg(f,0,1/beta,1e-8,100);
[I3,nr3]=quad(f,0,1/beta);
[I4,nr4]=quadl(f,0,1/beta);
sprintf('Cuadratura adaptiva: %.20f,   nr de evaluari %d', 4*pi*alfa*I1, nr1)
sprintf('Ronberg: %.20f,   nr de evaluari %d', 4*pi*alfa*I2, nr2)
sprintf('Matlab quad: %.20f,   nr de evaluari %d', 4*pi*alfa*I3, nr3)
sprintf('Matlab quadl: %.20f,   nr de evaluari %d', 4*pi*alfa*I4, nr4)
