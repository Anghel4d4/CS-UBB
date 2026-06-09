function x = backSubst(U,b)
  
n = length(b);
for k=n:-1:1
  x(k) = (b(k)-U(k,k+1:n)*x(1:n))/U(k,k);
end

end