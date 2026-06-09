x=0:5/3:5;
y=f(x);
A=zeros(3,4);
A(1,1)=f(pi);
A(2,1)=fder(pi);
A(3,1)=fsecder(pi);
%(a)
t=0:0.01:5;
pp=pchip(x,y);
coef=pp.coefs;
a=coef(:,1);
b=coef(:,2);
c=coef(:,3);
d=coef(:,4);
fpi=ppval(pp,pi);
pp.coefs=pp.coefs.*[0*ones(3,1) 3*ones(3,1) 2*ones(3,1) 1*ones(3,1)];
fderpi=ppval(pp,pi);
pp.coefs=pp.coefs.*[0*ones(3,1) 0*ones(3,1) 6*ones(3,1) 2*ones(3,1)];
fdersec=ppval(pp,pi);

A(1,2)=fpi;
A(2,2)=fderpi;
A(3,2)=fdersec;
z=pchip(x,y,t);
plot(x,y,'*',t,z)
hold on
%(b) deBoor
[a,b,c,d]=Splinecubic(x,y,3);
z=valspline(x,a,b,c,d,t);
fpi=valspline(x,a,b,c,d,pi);
fderpi=valspline(x,zeros(size(a)),3*a,2*b,c,pi);
fdersec=valspline(x,zeros(size(a)),zeros(size(a)),6*a,2*b,pi);
A(1,3)=fpi;
A(2,3)=fderpi;
A(3,3)=fdersec;
figure(1)
plot(t,z)
%(c) cu derivate secunde
[a,b,c,d]=Splinecubic(x,y,1,[fsecder(a),fsecder(b)]);
t=0:0.01:5;
z=valspline(x,a,b,c,d,t);
fpi=valspline(x,a,b,c,d,pi);
fderpi=valspline(x,zeros(size(a)),3*a,2*b,c,pi);
fdersec=valspline(x,zeros(size(a)),zeros(size(a)),6*a,2*b,pi);
A(1,4)=fpi;
A(2,4)=fderpi;
A(3,4)=fdersec;
plot(t,z,'r')
legend('punctele de inter','de tipHermite','de tip deBoor','cu derivate secunde')
fprintf('   f(pi)    S_hermite(pi) S_deBoor(pi)  S cu deriv secunde\n')
disp(A)