function y=pb2()

%for n=10:15
  % disp([n,cond(hilb(n))])  
%end

for n=10:10:100
  c1 = max(eig(hilb(n)))*max(eig(invhilb(n)));
  c2 = (1+2^(1/2))^(4*n+2)/(2^(15/4)*(pi*n)^(1/2));
  disp([n,c1,c2]);
end

end

% format short g
% pb2
  
% A = hilb(n);
% n = 10;
% A = hilb(n)
% b = A*ones(n,1);
% x = A\b