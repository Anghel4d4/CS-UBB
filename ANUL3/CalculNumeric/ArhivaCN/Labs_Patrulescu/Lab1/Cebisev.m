function Cebisev(n)
    close all
    for k=1:n
        t(k)=(2*k-1)*pi/(2*n);
    end
    
    x=cos(t);
    hold on
    plot(x,zeros(1,length(x)),'ro');
    y=linspace(-1,1,n);
    plot(y,ones(1,length(y)),'b*');
    axis([-1.1 1.1 -0.1 1.1]);