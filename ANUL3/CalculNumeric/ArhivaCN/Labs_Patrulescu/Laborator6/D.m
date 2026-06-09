function rez = D(k)
    x = [0,1,2,4];
    f = [3,4,7,19];
    
    
    matrix = zeros(length(x),length(x)+1);
    
    matrix(:,1) = x
    matrix(:,2) = f
   
    k=1;
    i=1;
    j=3;
    while j < length(x) + 1
        i=1;
        while i < length(x)
            matrix(i,j) = (matrix(i+1,j-1) - matrix(i,j-1))./(x(i+k) - x(i))
            i = i + 1;
        end
        k = k + 1;
        j = j + 1;
    end
    
    matrix
    
    