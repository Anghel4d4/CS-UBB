function [S] = Taylor(x,n,tip)
    switch tip
        case 'sinus'
            S=0;
            for i=0:n
                S=S+(-1).^i.*x.^(2*i+1)./factorial(2*i+1);
            end
        case 'cosinus'
            S=0;
            for i=0:n
                S=S+(-1).^i.*x.^(2*i)./factorial(2*i);
            end
        case 'exponent'
            S=0;
            for i=0:n
                S=S+x.^(i)./factorial(i);
            end
    end
            