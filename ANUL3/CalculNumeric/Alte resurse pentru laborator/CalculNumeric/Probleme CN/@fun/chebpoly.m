function out = chebpoly(g)

gvals = flipud(g.vals);
n = g.n;
if (n==1), out = gvals; return; end
out = [gvals;gvals(end-1:-1:2)];

if (isreal(gvals))
  out = fft(out)/(2*n-2); 
  out = real(out);
elseif (isreal(1i*gvals))
  out = fft(imag(out))/(2*n-2);   
  out = 1i*real(out);
else
  out = fft(out)/(2*n-2);  
end
out = out(n:-1:1);
if (n > 2), out(2:end-1)=2*out(2:end-1); end
