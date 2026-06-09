function a = epsilon()
    x = 1;
    a = x;
    while (1+x>1)
        a = x;
        x = x / 2;
    end
end