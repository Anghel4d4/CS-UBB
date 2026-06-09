function y=f(x,tipex)
switch tipex
    case 'ex1'
        y=1./(1+x.^2);
    case 'ex2'
        y=cos(x);
end