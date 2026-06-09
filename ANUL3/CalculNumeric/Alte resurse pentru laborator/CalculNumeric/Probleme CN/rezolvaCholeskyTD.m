%Problema 2.29. Implementat¸i un algoritm O(n) pentru rezolvarea unui sistem tridiagonal cu
%matrice SPD prin descompunere Cholesky

function x = rezolvaCholeskyTD(A, b)

    [m n] = size(A);
    
    % factorizare
    
    R = A;
    for k = 1:n-1
        j=k+1;
        if j<n
            R(j, j:j+1) = R(j, j:j+1) - R(k, j:j+1)*R(k, j)/R(k,k);
        else
            R(j, j) = R(j, j) - R(k, j)*R(k, j)/R(k,k);
        end
        R(k, k:k+1) = R(k, k:k+1)/sqrt(R(k,k));
    end
    R(n, n) = sqrt(R(n,n));
    
    %substitutii
    
    y = zeros(n, 1);
    y(1)=b(1)/R(1,1);
    for i=2:n
        y(i) = (b(i)-R(i-1,i)' * y(i-1))/R(i,i);
    end
    x = zeros(n, 1);
    x(n) = y(n)/R(n,n);
    for i = n-1:-1:1
        x(i) = (y(i) - R(i, i+1) * x(i+1))/R(i,i);
    end