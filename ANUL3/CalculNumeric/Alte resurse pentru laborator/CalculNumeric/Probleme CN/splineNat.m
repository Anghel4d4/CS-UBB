function yi=splineNat(x,y,xi)
    %calculeaza fct spline de interpolare(x,y)
    %in pct xi
    n=length(x);
    a=rezolvaSplineNat(x,y);
    yi=zeros(1,length(xi));
    for j=1:length(yi)
        
        i_find=find(x>=xi(j));
        if ~isempty(i_find)
            i=i_find(1)-1;
            if(i==0)
                i=1;
            end
        else
            i=n-1;
        end
        
        %if xi(j)<x(1) 
            %i=1;
        %else 
                %i=-1;
                %for k=1:n-1
                    %if x(k)<=xi(j) && xi(j)<x(k+1)
                        %i=k;
                    %end
                %end
                %if i==-1
                    %i=n-1;
                %end
        %end
        %yi(j)= a(3*i-2)*(xi(j)-x(i))^3+a(3*i-1)*(xi(j)-x(i))^2+a(3*i)*(xi(j)-x(i))+y(i);
        yi(j)=polyval([a(3*i-2:3*i),y(i)],xi(j)-x(i));
    end
end