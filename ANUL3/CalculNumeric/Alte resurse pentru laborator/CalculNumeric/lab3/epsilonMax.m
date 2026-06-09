function a = epsilonMax()
    x = 2-epsilon();
    a = x;
    while (2*x>1)
        a = x;
        x = x * 2;
    end
end

