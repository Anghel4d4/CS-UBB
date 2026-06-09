function f
func = @(x) cos((x+1)/2)/sqrt((x+1)/2);
eps = 10^(-9);
n=2;
[nod,coeff]= Gauss_Jacobi(n,0,-1/2);
I = vquad(nod,coeff,func);
I1=0;
I2=I;
while abs(I1-I2)>eps
    n=n+1;
    [nod,coeff]=Gauss_Jacobi(n,0,-1/2);
    I = vquad(nod,coeff,func);
    I1=I2;
    I2=I;
end
n
I