Re=[0.2 2 20 200 2000 20000];
C_D=[103 13.9 2.72 0.8 0.401 0.433];
Re=log(Re);
C_D=log(C_D);
[a,b,c,d]=Splinecubic(Re,C_D,2);
R=[5 50 500 5000];
R=log(R);
C=valspline(Re,a,b,c,d,R);
fprintf('   Re     C_D  \n')
disp([exp(R'), exp(C)])


rr=linspace(min(Re),max(Re),100);

RR=valspline(Re,a,b,c,d,rr);
loglog(exp(rr),exp(RR),exp(Re),exp(C_D),'*r')
xlabel('C_D')
ylabel('Re')

der=valspline(Re,zeros(size(a)),3*a,2*b,c,rr);
hold on
loglog(exp(rr),exp(der),'g')
legend('Spline cubic','puncte C_D,Re','deriv lui C_D in rap cu Re')
