function [a,b,exact]=LimiteInterval(tipex)
switch tipex
    case 'ex1'
      a=0;b=1;exact=pi/4;
    case 'ex2'
        a=0;b=pi/2;exact=1;
end