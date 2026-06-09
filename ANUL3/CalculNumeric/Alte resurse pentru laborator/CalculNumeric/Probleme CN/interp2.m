function yi = interp2(x,y,xi)
    n = length(x);
    if n ~= length(y)
        error ('date incorecte')
    end
    
    A = zeros(1,n);
    
    for j=1:n
        A(j) = 1./prod(x(j) - [x(1:j-1),x(j+1:n)]);
    end
    
    yi= zeros(1,length(xi));
    for k = 1:length(xi)
       t = find(xi(k) == x);
       if isempty(t)
           yi(k) = sum(y.*A./(xi(k)-x))/ sum(A./(xi(k)-x));
       else
           yi(k) = y(t(1));
       end
         
    end
       
    
end