function tema(n)
    disp(n)
    if n == 1
       disp('Stop')
    elseif n%2 == 0
        tema(n/2)
    else
        tema(3*n+1)
    end