[g_nodes,g_coeff]=Gauss_Ceb1(10);
f=@(x)cos(x);
I=vquad(g_nodes,g_coeff,f) %valoarea integralei aproximata de noi
f=@(x)cos(x)./sqrt(1-x.^2);
x=integral(f,-1,1)%valoarea integralei aproximata de matlab vu "integral"

f=@(x)cos(x).^2;
I=vquad(g_nodes,g_coeff,f)
f=@(x)cos(x).^2./sqrt(1-x.^2);
x=integral(f,-1,1)