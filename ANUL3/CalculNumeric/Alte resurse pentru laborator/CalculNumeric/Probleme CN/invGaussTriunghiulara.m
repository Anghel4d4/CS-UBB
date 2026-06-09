function X = invGaussTriunghiulara(A)
%rezolva sistemul A * X = I prin
% metoda eliminarii Gauss
    [n, m] = size(A);
    if n ~= m
        error('Matricea nu e patratica')
    end
    A = [A, eye(n)]; % matricea extrinsa
    X = zeros(n);
    
    for i=1:n-1
        for p = i:n
            if A(p, i) ~= 0
                break;
            end
        end
        if p == n
            error('nu exista solutie unica')
        end

        if p ~= i
           minpi = min(p,i);
           A([p,i], 1:minpi) = A ([i,p], 1:minpi); 
           A([p,i], n+1:2*n) = A ([i,p], n+1:2*n); 
        end
        
        for j=i+1:n
           mij = A(j, i) / A(i, i); 
           A(j, :) = A(j,:) - mij * A(i, :);
        end
    end
    
    if A(m,n) == 0
        error('nu exista solutie unica')
    end
        
    X(n, :) = A(n, n+1 : 2*n) / A (n,n);
    for i = n-1:-1:1
       X(i, : ) = (A(i, n + 1 : 2 * n) - A(i, i+1 : n) * X(i+1:n, : )) / A(i,i); 
    end
end