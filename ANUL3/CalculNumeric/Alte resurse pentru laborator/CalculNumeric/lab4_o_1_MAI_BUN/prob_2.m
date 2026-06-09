function [L, U, P] = prob_2(A)
  
  [m,n] = size(A);
  P = zeros(m,n);
  piv = (1:m);
  
  for i=1:m-1
    
    [pm,kp] = max(abs(A(i:m,i)));
    kp = kp+i-1;
    
    if i~=kp
      
      A([i,kp],:) = A([kp,i],:);
      piv([i,kp]) = piv([kp,i]);
      
    endif
    
    lin = i+1:m;
    
    if (A(i,i) == 0)
      
      A(lin,i) = 0;
      
    else
    
      A(lin,i) = A(lin,i)/A(i,i);
      
    endif
    
    A(lin,lin) = A(lin,lin)-A(lin,i)*A(i,lin);
    
  endfor
  
  for i=1:m
    
    P(i,piv(i)) = 1;
    
  end;
  
  U = triu(A);
  L = tril(A,-1)+eye(m);
  
end
    
    