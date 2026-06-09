function [Q R] = factQR(A)
    [m n] = size(A);
    R = zeros(n);
    for k = 1:n
        for i = 1:k-1
            R(i, k) = A(:, i)'*A(:, k);
        end
        for i = 1:k-1
            A(:, k) = A(:, k) - A(:, i) * R(i, k);
        end
        R(k, k) = sqrt(A(:,k)'*A(:,k)); 
        A(:, k) = A(:, k) / R(k,k);
    end
    Q = A;