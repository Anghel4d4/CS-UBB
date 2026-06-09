function y=myplot(n,x)
    y=1;
    for i=1:n
        y=y+x^i/factorial(i);
    end
    
  