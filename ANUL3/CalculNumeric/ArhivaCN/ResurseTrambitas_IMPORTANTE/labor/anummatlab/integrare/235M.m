function x = 235M()
f = @(x) cos(x)/sqrt(x);
eps = 10^(-9);
n=2;
[nod,coeff]= Guass_Jacobi(n);
I = vquad(nod,coeff);
I1=0;
I2=I;
while abs(I1-I2)>eps
    n=n+1;
    [nod,coeff]=Gauss_Jacobi(n);
    I = vquad(nod,coeff,f);
    I1=I2;
    I2=I;
end;
n
I