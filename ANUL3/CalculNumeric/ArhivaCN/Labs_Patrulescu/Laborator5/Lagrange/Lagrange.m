function L=Lagrange(z,x)
%functie care calculeaza polinoamele fundamentale Lagrange
%varianta comentata este implementarea nevectorizata

n=length(x);
m=length(z);
L=zeros(n,m);

  for i=1:n
      Numarator=ones(1,m); 
   for j=[1:i-1,i+1:n]
          Numarator=Numarator.*(z-x(j))/(x(i)-x(j));
   end
   L(i,:)=Numarator;
  end
% $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
%  for k=1:m
%   for i=1:n
%       Numarator(i)=1; Numitor(i)=1;
%    for j=1:n
%       if i~=j
%           Numarator(i)=Numarator(i)*(z(k)-x(j));
%           Numitor(i)=Numitor(i)*(x(i)-x(j));
%       end
%    end
%    L(i,k)=Numarator(i)/Numitor(i);
%   end
% end 
  