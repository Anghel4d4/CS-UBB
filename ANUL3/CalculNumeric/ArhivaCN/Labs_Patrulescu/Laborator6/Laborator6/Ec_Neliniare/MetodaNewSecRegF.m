function MetodaNewSecRegF
clear all
clc
close all

Nmax=1000;


%Metoda Newton
count=1;
x0=1.8;% Valoarea de start
epsilon=10^(-10);
f0=f(x0);
f0d=fderiv(x0);

fprintf('n\t| x_n\t\t\t|\t f(x_n)\t\t|\t f''(x_n) \t| -f''(x_n)/f(x_n)\n')
fprintf('______________________________________________________________________\n')
fprintf('%d\t|%.12f\t|%.12f\t|%.12f\t\t|%.12f\n',1,x0,f(x0),fderiv(x0),-f0/f0d)
while count<Nmax
    x1=x0-f(x0)/fderiv(x0);
    f1=f(x1);
    f1d=fderiv(x1);
    count=count+1;
    fprintf('%d\t|%.12f\t|%.12f\t\t|%.12f\t\t|%.12f\n',count,x1,f1,f1d,-f1/f1d)
    if abs(x1-x0)<epsilon
       break
    end
    x0=x1;
    
end


% Metoda Secantei
clear all

fprintf('\n')
fprintf('\n')

fprintf('\n')
fprintf('\n')


Nmax=1000;
x1=1.5; x2=2;
f1=f(x1); f2=f(x2);
count=2;
epsilon=10^(-10);


fprintf('n\t| x_n\t\t\t|\t f(x_n)\t\t|  -f(x_n)(x_n-x_{n-1})/(f(x_n)-f(x_{n-1}))\n')
fprintf('______________________________________________________________________\n')
fprintf('%d\t|%.12f\t|%.12f\t|%.12f\t\n',1,x1,f1,0)
fprintf('%d\t|%.12f\t|%.12f\t\t|%.12f\t\n',2,x2,f2,-f2*(x2-x1)/(f2-f1))
while count<Nmax
    x3=x2-f2*(x2-x1)/(f2-f1);
    f3=f(x3);
    count=count+1;
    fprintf('%d\t|%.12f\t|%.12f\t\t|%.12f\n',count,x3,f3,-f3*(x3-x2)/(f3-f2))
    if abs(x3-x2)<epsilon
      break
    end
    x1=x2;
    x2=x3;
    f1=f2;
    f2=f3;
end

% Metoda Regula Falsi
clear all

fprintf('\n')
fprintf('\n')

fprintf('\n')
fprintf('\n')


Nmax=1000;
x1=1.5; x2=2;
f1=f(x1); f2=f(x2);
count=2;
epsilon=10^(-10);


fprintf('n\t| x_n\t\t\t|\t f(x_n)\t\t|  -f(x_n)(x_n-x_{n-1})/(f(x_n)-f(x_{n-1}))\n')
fprintf('______________________________________________________________________\n')
fprintf('%d\t|%.12f\t|%.12f\t|%.12f\t\n',1,x1,f1,0)
fprintf('%d\t|%.12f\t|%.12f\t\t|%.12f\t\n',2,x2,f2,-f2*(x2-x1)/(f2-f1))
while count<Nmax
    x3=x2-f2*(x2-x1)/(f2-f1);
    f3=f(x3);
    count=count+1;
    fprintf('%d\t|%.12f\t|%.12f\t|%.12f\t\n',count,x3,f3,-f3*(x3-x2)/(f3-f2))
    if abs(x3-x2)<epsilon
      break
    end
    if f2*f3<0
    x1=x2;
    f1=f2;
    end
    x2=x3;
    f2=f3;
end




 