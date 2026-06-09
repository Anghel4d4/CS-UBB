function SplineCubic
    n = 3;
    x = [0,1,2];
    fx = [0,1,2];
    f1x = [0,1,2];
    a=zeros(1,4)
    for i=1,4
        strcat('a',num2str(i))
    end
    spline = zeros(n,4);
    
    
    
    
    