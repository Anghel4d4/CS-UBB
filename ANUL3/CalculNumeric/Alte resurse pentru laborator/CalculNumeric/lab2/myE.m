
function [e,n]= myE(err)
    n = 5;
    while abs((recinv(n+1)-recinv(n)))/recinv(n+1)>err
        n=n+1;
    end
    e = recinv(n);


function [e] =recinv(n)
    E = 0.5/(n+1);
    for i=n-1:-1:1
        E=(1-E)/(i+1);
    end
    e = 1/E;
       
end
end