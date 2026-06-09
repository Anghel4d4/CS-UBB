function prob_3 = prob_3(n)
  
  A = rand(n,n);
  disp('Matrix A : ');
  disp(A);
  b = A*ones(n,1);
  disp('b : ');
  disp(b);
  disp('Gauss : ');
  x = prob_1(n,A,b);
  disp(x);
  disp('LUP : ');
  x = lupsolve(A,b);
  disp(x);
  
end