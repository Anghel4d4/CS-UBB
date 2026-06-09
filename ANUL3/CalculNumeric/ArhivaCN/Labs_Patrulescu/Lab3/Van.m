function Van
    clear all
    close all
    n = 20;
    for k=1:n
        x=linspace(-1,1,k);
        V=vander(x);
        c(k)=cond(V);
        ca(k)=exp(-pi/4)/pi*exp(k*(pi/4+log(2)/2));
    end
    
    
    
    figure(1)
    hold on
    plot(1:n,log10(c),'b*')
    plot(1:n,log10(ca),'ro')