% n € N
% p(x) = (x-n)[x-(n-1)]...(x-1)x(x+1)...[x+(n-1)](x+n)
% 1.) poly(v) -> coef((x-v1)(x-v2)...(x-vn))
% 2.) p=[p 2n+1, p 2n, ... p 0]
%             roots

%function fun = laborator6(n)
  clc; clf;
  n=15;
  v=-n:n;
  
  coefs=poly(v);
  nc=condpol(coefs,v);
  [ncs,i]=sort(nc);
  disp([ncs',v(i)']);
  
  plot(v,zeros(size(v)),'b.','Markersize',16);
  hold on
    
  nc = 0;

    for k=1:1000
      epsi=1e-5*randn(size(coefs));
      pp=(1+epsi).*coefs;
      z=roots(pp);
      plot(z,'k.','Markersize',4);
      
      %coefs1=coefs+normrnd(0,1e-10,1,length(coefs));
      %rad1=roots(coefs1);
      
      %nc=nc+norm(rad1-rad)/norm(coefs1-coefs);
      %plot(rad1,'.','Markersize',6);
    end
%end
