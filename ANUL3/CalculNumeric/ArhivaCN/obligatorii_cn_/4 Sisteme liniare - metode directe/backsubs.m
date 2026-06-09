function x = backsubs(U,b)
    n=length(b);
    x=zeros(n,1);
    x(n)=b(n)/U(n,n);
    for k=n-1:-1:1
       x(k) = (b(k) - U(k+1: n, k)* x(k+1:n))/U(k,k); 
    end
    
end