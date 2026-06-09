function result = SquareRootPctB(x)
    % determinarea lui m si r
    for m = -100:100
        syms r
        res = solve(r == 2^(2*m)/x);

        if res >= 1/4 && res < 1
            myR = res;
            myM = m;
            break
        end
    end
    
    x0 = 1.27235367 + 0.242693281 * myR - 1.02966039/(myR+1);
    x1 = (x0 * ( x0^2 + 3*myR))/(3 * x0^2 + myR);
    x2 = (x1 * ( x1^2 + 3*myR))/(3 * x1^2 + myR);
    result = double((2^myM)/ x2);
end