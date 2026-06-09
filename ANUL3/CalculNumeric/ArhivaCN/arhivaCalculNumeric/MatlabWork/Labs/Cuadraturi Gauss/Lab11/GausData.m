function [A,x] = GausData(alpha, beta)

    J = diag(alpha) + diag(sqrt(beta(2:end)), 1) + diag(sqrt(beta(2:end)), -1);
    [V,D] = eig(J);
    x = diag(D);
    A = beta(1)*V(1,:).^2;