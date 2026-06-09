function c=mcmmpd(x, y, n)
    m = length(x); 
    x = x(:);
    y = y(:);
    A = []; 
    for k=n:-1:0
        A = [A, x.^k];
    end
    c = A\y;
