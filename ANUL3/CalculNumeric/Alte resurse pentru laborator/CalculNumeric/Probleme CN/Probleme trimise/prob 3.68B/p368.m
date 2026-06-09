clc
x=-3:0.05:3;
for k=1:5
    f=@(x) x.^k;
    c=coeffCebisev(f,k-1);
    fprintf('Coef aproximatiei lui x^%d de grad %d sunt:\n',k,k-1)
    disp(c)
    y=evalCebisev(c,x);
    figure(k)
    plot(x,f(x),x,y)
    legend('f(x)=x^k','aprox de ord k-1')
end