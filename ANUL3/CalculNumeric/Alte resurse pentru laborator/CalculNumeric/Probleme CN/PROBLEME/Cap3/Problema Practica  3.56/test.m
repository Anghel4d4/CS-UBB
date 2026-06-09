%(a)
x=linspace(-1,1,21);
y=f(x);
t=linspace(-1,1,41);
fi=lagr(x,y,t);
fprintf('    f(x)      p(x)     f(x)-p(x)\n')
disp([f(t)' fi'  f(t)'-fi'])
figure(1)
plot(t,f(t),t,fi)
legend('f(x)','p(x)')
%si din tabel si din figura se observa ca polinomul de grad 20 aproximeaza
%pe f cu erori foarte mari

%(b)
i=1:21;
x=cos((i-1)*pi/20);
y=f(x);
t=linspace(-1,1,41);
fi=lagr(x,y,t);
fprintf('    f(x)      p(x)     f(x)-p(x)\n')
disp([f(t)' fi'  f(t)'-fi'])
figure(2)
plot(t,f(t),t,fi)
legend('f(x)','p(x)')
%erorile sunt mai mici, aproximarea a devenit mai buna

%(c)
x=linspace(-1,1,21);
y=f(x);
[a,b,c,d]=Splinecubic(x,y,2);
z=valspline(x,a,b,c,d,t);
fprintf('    f(x)      p(x)     f(x)-p(x)\n')
disp([f(t)' z  f(t)'-z])
figure(3)
plot(t,f(t),t,z)
legend('f(x)','p(x)')
%avem aproximarea cea mai buna, fata de aproximarile precedente
