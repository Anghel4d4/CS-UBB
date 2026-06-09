disp('c1');
for n=10:10:100
  c1=max(eig(hilb(n)))*max(eig(invhilb(n)));
  disp([n,c1]);
end

disp('c2');
for n=10:10:100
  c2=power(1+sqrt(2),4*n+2)/(power(2,15/4)*sqrt(pi*n));
  disp([n,c2]);
end

for n=10:15
  t=
  disp([n,card(vander(t),inf)]);
end

