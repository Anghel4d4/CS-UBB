function [A,b]=genMatRar(n)
  e=ones(n,1);
  B=[-e,3*e,-e];
  A=spdiags(B,-1:1,n,n);
  e2=e/2;
  e2([n/2, n/2+1])=[0,0];
  c=spdiags(e2,0,n,n);
  c=fliplr(c);
  A=A+c;
  b=[2.5,1.5*ones(1,n/2-2),1,1,1.5*ones(1,n/2-2),2.5]';
end
