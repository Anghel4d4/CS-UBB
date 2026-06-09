clc
n=21;
a = randi([1,100],n,n);
A = triu(a) + triu(a,1)'

b = A * ones(n,1);

%x = rezolvaGssSim(A, b)


v=zeros(1/2*n*(n-1) + n,1)';

for i=1:n
    for j=1:i
        k = 1/2*i*(i-1) + j;
        v(k) = A(i,j);
    end
end

x=A\b

x= rezolvaGssSimVector(v,b,n)
