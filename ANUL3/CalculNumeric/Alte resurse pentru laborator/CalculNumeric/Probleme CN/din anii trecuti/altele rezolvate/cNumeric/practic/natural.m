function [a,b,c,d]=natural(x,y)
    n=length(x);
    x=x'; y=y';
    dx=diff(x);  dDiv=diff(y)./dx;
    stanga=dx(1:end-1); dreapta=dx(2:end);
    mijloc=2*(stanga+dreapta);
    tLiber=3*(dreapta.*dDiv(1:end-1)+stanga.*dDiv(2:end));
    
    tLiber1=3*dDiv(1);
    tLibern=3*dDiv(end);
    
    mijloc=[2;mijloc;2];
    st=[stanga;1;0];
    dr=[0;1;dreapta];
    tLiber=[tLiber1;tLiber;tLibern];
    A=spdiags([st,mijloc,dr],-1:1,n,n);
    m=A\tLiber;
    d=y(1:end-1);
    c=m(1:end-1);
    a=[(m(2:end)+m(1:end-1)-2*dDiv)./(dx.^2)];
    b=[(dDiv-m(1:end-1))./dx-dx.*a];
end