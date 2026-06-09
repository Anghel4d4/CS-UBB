function vectorcheck(f,x)

try
  v=f(x(:));
  if any(size(v) ~= size(x(:)))
    warning('chebfun:vectorwrap:shape',...
      'Your function may need to be vectorized. Wrap it inside a call to ''vec''.')
  end
catch %ME
  disp('Your function gives an error for vector input.')
  disp('Vectorize it, or wrap it inside a call to ''vec''.')
  rethrow(lasterror)  
end
    
end
