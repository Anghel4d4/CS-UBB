function p=p(x,xi,yi,m)
n=0;
num=0;
for j=1:m+1
   if (j==1)||(j==m+1)
       del=1/2;
   else
       del=1;
   end
    w=(-1)^(j-1)*del;
    n=n+w./(x-xi(j))*yi(j);
    num=num+w./(x-xi(j));
end
p=n./num;
