fprintf('\n-----------------------');
for n=1:5
    x0=1/n;
    for k=10:10:50
        x0=1/n;
        for j=1:k
            x1=(n+1)*x0-1;
            x0=x1;
        end
        fprintf('\nn=%d k=%d x=%g',n,k,x0);
    end
    
end