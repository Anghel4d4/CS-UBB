function [y]=RationalBernstein_ni(t,w,n,i)

Be=zeros(n+1,length(t));
for k=1:n+1
   Be(k,:)=w(k)*Bernstein_ni(t,n,k);
end

S=sum(Be);
y=Be(i,:)./S;