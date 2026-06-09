function li_rez = li(z,x)
    n = length(x);
    m = length(z);
    li_rez = zeros(n,m);
    
    for k=1:m
       for i=1:n
          numr(i)=1; 
          numi(i)=1;
        for j=1:n
           if i~=j
               numr(i)=numr(i)*(z(k)-x(j));
               numi(i)=numi(i)*(x(i)-x(j));
           end
        end
        li_rez(i,k)=numr(i)/numi(i);
       end
    end
    