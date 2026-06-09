function Pade
    clear all
    close all
    x=-2:0.1:2;
    m=2;n=3;
    
    c=fderiv(0,0:m+n)./factorial(0:m+n);
    A = zeros(m+n+1,m+n+1);
    A1 = diag(-ones(1,m+1));
    C1 = zeros(m+1,n);
    C2 = zeros(n,n);
    for i=1:n
        C2(i,:)=c(m+i:-1:m+1-n+i);
    end
    
    for i = 2:m+1
        C1(i,1:i-1)=fliplr(c(1:i-1))
    end
    
    A(1:m+1,1:m+1)=A1;
    A(1:m+1,m+2:m+n+1)=C1;
    A(m+2:m+n+1,m+2:m+n+1)=C2;
    
    b = -c';
    coef = A\b;
    Numarator = coef(1:m+1);
    Numitor = [1;coef(m+2:m+n+1)];
    Numarator = fliplr(Numarator');
    Numitor = fliplr(Numitor');
    Aprox = polyval(Numarator,x)./polyval(Numitor,x);
    
    figure(1)
    hold on
    plot(x,f(x),'b')
    plot(x,Aprox,'r*')
    