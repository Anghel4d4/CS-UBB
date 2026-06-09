function x = gauss(n,b)
a=rand(n);
a=[a b];
for i=1:n-1
%   if(max < abs(a(j, i)))
%      max = abs(a(j, i))
%      p = j
%   end
    
%end
% if ul este echivalent cu 
[~, p] = max(abs(a(i:n,i)));
if(p<0)
   % fprintf('Nu exista solutie unica');
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

%if( a(mij, n) == 0)
   % fprintf('nu exista solutie unica');
%end

%substitutia inversa
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


%La matricea A se adauga vectorul B a.i. fiecare modificare asupra lui A sa
%se faca si asupra lui b
%La final o sa se afiseze n+1 ca fiind B
%matricea U este matricea triunchiulara superioara obtinuta din A dupa
%modificarile prin eleiminarea lui gauss
%cand se schimba 2 linii se pun in P
%L este matricea care scade o linie dintr o alta linie


%A([i p],:)=A([p i],:) - intechimbarea liniei i cu p
%A(i,:) - toate elementele de pe linia i