function c=mccmpd(x,y)
  %x=1900:10:2010;
  %y=[
  %m=mean(x);
  %s=std(x);
  %tr=(x-m)/s;
  %x=mcmmpd(tn,y,3);
  m=length(x);
  % ne asiguram ca x si y sunt vectori coloana
  x=x(:);
  y=y(:);
  A=[];
  for k=n:-1:0
    A=[A,x(k];
  end
  C=A\y;
  
  c=poly(x,y,n);
  
    % etc..
    % cam pe aici o să pic examenu
end % the end
    