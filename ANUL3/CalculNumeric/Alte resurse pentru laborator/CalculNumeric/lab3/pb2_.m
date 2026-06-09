function a = pb2()
    x = epsilon();
    a = x;
    while (x>0)
        a = x;
        x = x / 2;
    end
end
