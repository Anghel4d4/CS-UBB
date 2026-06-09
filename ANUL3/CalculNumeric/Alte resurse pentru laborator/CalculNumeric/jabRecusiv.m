function  x = jabRecusiv(A, b, eps)
    dim = size(A, 1);  
    M = zeros(dim, dim);
    L = M - tril(A);
    U = M - triu(A);
    N = L + U;
    T = inv(M) * N;
    prev = zeros(1,dim); 
    x = prev;
%    c = inv(M) * b;
    for i=1:dim
       s = 0;
       for j=1:dim
           if j==i
               s = s+ A(i,j) * prev(j);
           end
       end
       x(i) =1/ A(i,i) * (b(i)-s);
       prev = x;
    end
    while (norm(x-prev, inf) >= eps * (1-norm(T, inf))/norm(T,inf) )
        for i=1:dim
           s = 0;
           for j=1:dim
               if j==i
                   s = s+ A(i,j) * prev(j);
               end
           end
           x(i) =1/ A(i,i) * (b(i)-s);
           prev = x;
        end
    end
   
end