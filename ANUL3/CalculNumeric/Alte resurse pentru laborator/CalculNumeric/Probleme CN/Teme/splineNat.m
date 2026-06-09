function yi = splineNat(x,y,xi)
n = length(x);
a = rezolvaSplineNat(x,y);
yi = zeros(1, length(xi));
for j = 1:length(yi)
    for k = 1:n-1
        if (xi(j)<x(1))
            i=1;
        end;
        if (x(k)<=xi(j) && xi(j)<x(k+1))
            i=k;
        end;
        if (xi(j)>x(n)) 
            i=n-1;
        end
    end
    yi(j)=a(3*i-2)*(xi(j)-x(i))^3 + a(3*i-1)*(xi(j)-x(i))^2 + a(3*i)*(xi(j)-x(i)) + y(i);
end