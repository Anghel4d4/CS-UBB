%dam functiile p, q, r, care se cunosc, si alfa beta
p=@(x)x.^2;
q=@(x)x/2;
r=@(x)sin(x);
alfa=2;
beta=10;

%cu cat luam pentru n o valoare mai mare, aproximarea este mai exacta si
%graficul este mai corect
n=100;
h=(alfa + beta)/(n+1);

%in ceea ce urmeaza generam matricea tridiagonala A
A = spdiags([(2-h*p(1:n))', (-2*(h^2*q(1:n)+2))', (2+h*p(1:n))'], [-1, 0, 1],n,n);

%termenii liberi ii punem in vectorul coloana b
b=ones(n,1);
b(1,1)= alfa *(2+h*p(1)) - 2*h^2*r(1);
for i=2:n-1
    b(i,1) = -2*h^2*r(i);
end
b(n,1) = beta *(2-h*p(n))-2*h^2*r(n);

%necunoscutele le punem in vectorul coloana y
y=ones(n,1);

%sistem se poate scrie sub forma A*y + b = 0


% rezolvam sistemul prin metoda Gauss-Seidel
x = zeros(n,1);
[n,m] = size(A);
    
    for i=1:n-1
        p = i;
        err = 1;
        while p<=n
            if A(p,i)~=0
                err = 0;
                break
            end
        end
        
        if err==1
            error('Nu exista solutie unica')
        end
        
        if p~=i
           A([p,i],:) = A([i,p],:);
        end
        
        for j=i+1:n
            mji = A(j,i)/A(i,i);
            A(j,:) = A(j,:)-mji*A(i,:);
        end
        % disp(A);
    end
    
    if A(m,n)==0
        error('Nu exista solutie unica.')
    end
    
    x(n) = A(n-1,n)/A(n,n);
    for i=n-1:-1:1
        x(i) = A(i,n);
        for j=i+1:n
            x(i) = x(i)-A(i,j)*x(j);
        end
        x(i) = x(i)/A(i,i);
    end
    
    x
