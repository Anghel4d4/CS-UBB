%epsilon masina
function y=myeps()
    x=1;
    while 1 + x ~=1
        x = x/2;
    end
    y=2*x;
end