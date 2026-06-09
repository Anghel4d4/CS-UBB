function y=pb3()

for n=10:15
  t = linspace(-1,1,n);
  disp([n,cond(vander(t),inf)]);
end

end