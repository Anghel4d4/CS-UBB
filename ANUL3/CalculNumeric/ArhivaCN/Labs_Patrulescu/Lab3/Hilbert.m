function Hilbert
    clear all
    close all
    n = 50;
    for k=1:n
        H = hilb(k);
        c(k) = cond(H);
        d(k) = det(H);
        ca(k) = ((sqrt(2)+1).^(4.*k + 4))./((2.^(15./4)).*sqrt(pi.*k))
    end
    
    figure(1)
    hold on
    plot(1:n,log10(abs(d)),'b*')
    
    figure(2)
    hold on
    plot(1:n,log10(c),'ro')
    plot(1:n,log10(ca),'b*')
    