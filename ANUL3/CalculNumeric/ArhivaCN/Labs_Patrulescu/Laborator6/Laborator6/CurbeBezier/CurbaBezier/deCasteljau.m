function [C1,C2]=deCasteljau(u,Bx,By)

Bxn=Bx; Byn=By;
n=length(Bxn);% gradul polinoamelor Bernstein

for i=1:n
  for j=1:n-i
  Bxn(j)=(1-u)*Bxn(j)+u*Bxn(j+1);
  Byn(j)=(1-u)*Byn(j)+u*Byn(j+1);
  end
end
C1=Bxn(1);
C2=Byn(1);