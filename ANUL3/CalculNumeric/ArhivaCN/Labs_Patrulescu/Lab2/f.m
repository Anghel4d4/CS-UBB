function y=f(x,tip)
    switch tip
        case 'ex1'
            y=1./(1+x.^2);
        case 'ex2'
            y=abs(x)+x./2-x.^2;
    end