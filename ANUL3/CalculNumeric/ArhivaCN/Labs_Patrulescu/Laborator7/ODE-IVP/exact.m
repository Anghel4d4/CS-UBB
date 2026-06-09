function rez=exact(x,tipex)
global y0 lambda
switch tipex
    case 'ex1'
        rez=y0*exp(-lambda*x);
end