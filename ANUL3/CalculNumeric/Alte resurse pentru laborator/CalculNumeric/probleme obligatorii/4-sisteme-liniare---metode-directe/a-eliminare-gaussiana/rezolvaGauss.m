function x =rezolvaGauss(A, b)
% Algoritmul 1
% rezolva sistem A*x = b prin metoda eliminarii lui Gauss

% Eliminare

[n, m] = size(A);
if (n~=m)
    x = 'A nu e matrice patratica';
    return;
end
A = [ A b];

for i=1:(n-1)
    % afla p
    p = i;
    while (p <= n && A(p,i) == 0)
        p = p +1;
    end
    if (p == n+1)
        x = 'Nu exista solutie unica';
        return;
    end
    
    % interschimbare linia p cu linia i
    if ( p~=i )
        %fprintf('matricea inainte de intreschimbarea liniei %d cu %d', p, i);
        %A
        
        A([p,i],:) = A([i,p],:);
        
        % sau:
        %aux = A(p,:);
        %A(p,:) = A(i,:);
        %A(i,:) = aux;
        %fprintf('matricea DUPA de intreschimbarea liniei %d cu %d', p, i);
        %A
    end
    
    for j=(i+1):n
        mij = A(j,i)/A(i,i);
        A(j,:) = A(j,:) - mij*A(i,:);
    end
end

if A(m,n) == 0 
    x = 'Nu exista solutie unica';
    return;
end

% Substitutie inversa
x = zeros(n, 1);
x(n) = A(n,n+1)/A(n,n);
for i=(n-1):-1:1
    suma = 0;
    for j=(i+1):n
        suma = suma + A(i,j)*x(j);
    end
    x(i) = (A(i,n+1) - suma)/A(i,i);
end