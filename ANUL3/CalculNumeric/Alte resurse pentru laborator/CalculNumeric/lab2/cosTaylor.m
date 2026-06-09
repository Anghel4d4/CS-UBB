function [cos1,k]=cosTaylor(x,err)
x=mod(x,2*pi);
cos1=1;
termen=-x^2/2;
k=2;
while k<100
    cos1=cos1+termen;
    k=k+1;
    termen=termen.*x/k;
    k=k+1;
    termen=-termen.*x/k;
    if abs(termen)<err
        return;
    end
end
error('nu converge');







