function  [L U P] = descLUP(A)
    [n, m] = size(A);
    if n~=m 
        error('Matricea nu e patratica')
    end
    P = eye(n);
    for i=1:n
        [amax, jmax] = max(abs(A(i:n,i)));
        jmax = jmax + i - 1;
        if i~=jmax
            P([i, jmax], :) = P([jmax, i], :);
            A([i, jmax], :) = A([jmax, i], :);
        end
        if A(i,i)==0
            error('Matricea e singulara')
        end
        A(i+1:n,i) = A(i+1:n,i)/A(i,i);
        A(i+1:n, i+1:n) = A(i+1:n, i+1:n) - A(i+1:n, i)*A(i, i+1:n);
    end
    L = tril(A, -1) + eye(n);
    U = triu(A);