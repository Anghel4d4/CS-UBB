function x = prob_1(n,A,b)
a=[A b];
for i=1:n-1
  [~, p] = max(abs(a(i:n,i)));
  if(p<0)
      fprintf('Nu exista solutie unica');
      break;
  end

  if(p ~= i)
      a([p i],:) = a([i p],:);
  end

  for jj=i+1:n
      mij = a(jj,i)/a(i,i);
      f= a(jj,:) - mij * a(i,:);
      a(jj,:) =f;
  end

  x(n) = a(n, n+1)/a(n,n);
  for ii = n-1:-1:1
        sum = 0;
        for j = ii+1:n
             sum = sum + a(ii,j)*x(j);
        end
         x(i) = (a(ii,n+1) - sum) / a(ii,ii);
        end

        end
end