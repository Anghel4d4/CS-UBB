function x=rezolvaGauss(A,b)
[n, m]=size(A);
A=[A, b];
if(n~=m)
    error('Matricea nu e patratica')
end
x=zeros(n,1);
for i = 1:n-1
    p=i;
    while A(p, i) == 0 && p<n
        p=p+1;
    end
    if(A(p, i) == 0)
        error('nu exista solutie unica');
    end
    if (p ~= i)
        A([p,i],:)=A([i,p],:);
    end
    for j = i+1:n
        mji = A(j,i)/A(i,i);
        A(j,:)=A(j,:)-mji*A(i,:);
    end
end
if A(m,n) == 0
    error('Nu exista solutie unica');
end
x(n) = A(n, n+1)/A(n,n);
for i = n-1:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum +A(i, j)*x(j);
    end
    x(i) = (A(i,n+1)-sum)/A(i,i);
end
    
