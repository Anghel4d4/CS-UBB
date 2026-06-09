function c=mcmmpd(x,y,n)
    x=x(:); y=y(:);  % vector coloana
    A=[];
    for k=n:-1:0
       A=[A, x.^k]; 
    end
    c=A\b;
end