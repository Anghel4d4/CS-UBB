function prob_5 = prob_5(n)
  
  A = zeros(n);
  
  for i = 1:rows(A)
    for j = 1:columns(A)
      
      if(i > j)
        A(i,j) = -1;
      endif
      
      if(i == j)
        A(i,j) = 1;
      endif
      
      A(i,columns(A)) = 1;
     
    endfor
  endfor
  
  b = zeros(n,1);
  
  for i = 1:size(b,1)
    b(i) = -i + 3;
  endfor

  disp(A);
  disp(b);
  
  x = lupsolve(A,b);
  
  disp(x);
  
  x = prob_1(n,A,b);
  
  disp(x);
  
end