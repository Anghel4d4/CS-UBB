function x = chebpts(n,d)

if n<=0, 
    error('Input should be a positive number');
elseif n==1,
    x=0; 
else
    m = n-1;
    x = sin(pi*(-m:2:m)/(2*m))';
end

% rescale x if d is provided:
if nargin > 1
    d = domain(d);
    ab = d.ends;
    x = (x+1)/2*(ab(end)-ab(1)) + ab(1); 
end