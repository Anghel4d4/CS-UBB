function lambda=Eigen2x2(A)
%EIGEN2X2 - Calculeaza valorile proprii ale unei matrice 2x2
%A - matricea 2x2
%lambda - valorile proprii

b=trace(A); c=det(A);
d=b^2/4-c;
if d > 0
    if b == 0
        lambda = [sqrt(c); -sqrt(c)];
    else
        x = (b/2+sign(b)*sqrt(d));
        lambda=[x; c/x];
    end
else
    lambda=[b/2+i*sqrt(-d); b/2-i*sqrt(-d)];
end