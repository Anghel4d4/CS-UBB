syms t


f=@(alpha)(3*pi/4)*cos((3*pi/4)*t+3*pi/4)/((3*pi/4)*t+3*pi/4)^alpha;
fd=@(alpha)((3*pi*(1/4))^(1-alpha)*log(3*pi*(1/4))*(quad(sin((1/4)*pi*(3*t+1))/(t+1)^alpha,-1,1))-(3*pi*(1/4))^(1-alpha)*(quad(-sin((1/4)*pi*(3*t+1))*ln(t+1)/(t+1)^alpha, -1,1)));
for p=1:1:20
    for n=1:10
        [x,A]=Gauss_Jacobi(n,0,p);
    end
end
disp(x)
disp(A)
x0=1;
%[z,ni]=Newton(f,fd,x0,0,10e-4,100);
