function [A,x] = genereazaCebisev(n)
    %genereaza cuadratura Gauss-Cebisev cu n randuri
    
    alpha = zeros(1,n);
    
    beta = [pi,pi/2,1/4 *ones(1,n-2)];
    
    j = diag(alpha) + diag(sqrt(beta(2:n)),1) + diag(sqrt(beta(2:n)),-1);

    %se produce o matrice diagonala D cu valorile proprii si o matrice V a
    %carei coloane sunt vectorii proprii corespunzatori astfel incat
    %X*V = V*D
    [v,D] = eig(j);
    
    A = beta(1) * v(1,:).^2;
    
    x = diag(D); 
    
end