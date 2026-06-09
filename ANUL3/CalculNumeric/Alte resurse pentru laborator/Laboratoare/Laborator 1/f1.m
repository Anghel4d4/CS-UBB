for n=9: 20
  err=exp(2)/factorial(n+1);
  disp([n, err]);
  
  if err<eps; break; end
end