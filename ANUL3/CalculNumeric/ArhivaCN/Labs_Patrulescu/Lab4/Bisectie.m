function Bisectie
    clear all
    close all
    clc
    a=1.5;b=2;
    fa = f(a); fb=f(b);
    dif = abs(b-a);
    epsilon = 10^(-10);
    count = 0;
    while dif > epsilon
        m = 0.5*(a+b)
        fm=f(m)
        if fa*fm<0
            b=m;
            fb=fm;
        else
            a=m;
            fa=fm;
        end
        count = count+1;
        dif = abs(b-a)
         fprintf('%.10f\t%.10f\t%.10f\t%.10f\n',a,m,b,dif)
    end
    count
    %fprintf('%.10f\t%.10f\t%.10f\t%.10f\n',a,m,b,dif)
    log(0.5/epsilon)/log(2)