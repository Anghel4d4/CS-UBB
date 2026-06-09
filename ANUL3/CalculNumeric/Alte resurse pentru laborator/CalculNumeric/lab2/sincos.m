function [sin1,cos1,k]=sincos(x,err)
x=mod(x,2*pi);
sin1=x;
cos1=1;
termen=-x^2/2;
k=2;
while k<100
    cos1=cos1+termen;
    k=k+1;
    termen=termen.*x/k;
    sin1=sin1+termen;
    k=k+1;
    termen=-termen.*x/k;
    if abs(termen)<err
        return;
    end
end
error('Nu converge')








