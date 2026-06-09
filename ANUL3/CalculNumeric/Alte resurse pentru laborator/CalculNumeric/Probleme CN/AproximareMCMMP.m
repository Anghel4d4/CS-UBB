clc
x=linspace(0,5,200);
y=1-heaviside(x-1);
col=hsv(5);
plot(x,y,'color',col(1,:));
hold on

for n=1:8
    A=zeros(n,n);
    b=zeros(1,n);
    for k=1:n
        b(k)=(1-exp(-k))/k;
        for j=1:n
            A(k,j)=1/(j+k);
        end
    end
    
    a=A\b';
    
    fprintf('n = %d, numarul de conditionare = %d\n', n, cond(A))
    solutia = a'
    
    if n<=4
        f = a'*exp(-(1:n)'*x);
        plot(x,f,'color',col(n+1,:));
    end
end

legend('f','aprox1','aprox2','aprox3','aprox4');
hold off


