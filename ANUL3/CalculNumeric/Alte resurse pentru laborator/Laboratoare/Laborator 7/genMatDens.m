function [A,b]=genMatDens(n)
  e=ones(n,1);
  e1=e(1:end-1);
  A=3*diag(e)-diag(e1,1)-diag(e1,-1);
  e2=e/2;
  e2([n/2, n/2+1])=[0,0];
  c=diag(e2);
  A=A+fliplr(c);
  b=[2.5,1.5*ones(1,n/2-2),1,1,1.5*ones(1,n/2-2),2.5]';
end
