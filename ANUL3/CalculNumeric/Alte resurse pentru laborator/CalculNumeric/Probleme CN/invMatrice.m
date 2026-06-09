function B=invMatrice(U)

%cu eliminare Gauss

[n,m]=size(U);
if n~=m
    error('Matricea U nu este matrice patratica.')
end

B=eye(n);

for j=1:n-1
    for i=j+1:n
        B(i,:)=B(i,:)-U(i,j)*B(j,:);
    end
end

        