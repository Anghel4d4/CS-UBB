function w = bary_weights(xk)

n = length(xk);
C = 4/(max(xk)-min(xk)); % Capacity of interval
if n < 300          % for small n using matrices is faster
   XK = repmat(xk(:),1,n);
   V = C*(XK-XK');
   V(logical(eye(n))) = 1;
   VV = exp(sum(log(abs(V))));
   w = 1./(prod(sign(V)).*VV).';
else               % for large n use a loop
   w = ones(n,1);
   for j = 1:n
       v = C*(xk(j)-xk);
       v = v(logical(v));
       vv = exp(sum(log(abs(v))));           
       w(j) = 1./(prod(sign(v))*vv);
   end
end
% Scaling
w = w./max(abs(w));
