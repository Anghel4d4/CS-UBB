function L = cholesky(M)

n = length(M);
L = zeros(n,n);
for i=1:n
   L(i,i) = sqrt(M(i,i) - L(i,:)*L(i,:)');
   for j=(i+1):n
      L(j,i) = (M(j,i) - L(i,:)*L(j,:)')/L(i,i);
   end
end

end

%A = [1 2 1; 2 5 3; 1 3 3;]
%L = cholesky(A)
%y = L\b
%x = L'\y