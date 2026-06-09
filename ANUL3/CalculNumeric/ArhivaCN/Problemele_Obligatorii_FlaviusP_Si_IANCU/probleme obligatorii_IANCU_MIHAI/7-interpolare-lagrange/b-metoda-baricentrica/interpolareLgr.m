function y1 = interpolareLgr(x, y, z)

n = length(z);
m = length(x);
y1 = zeros(1,n);
for k=1:n
    vx = z(k);
    [i,j] = find(x == vx);
    if ~isempty(j)
        vy = y(i,j);
    else
         s1=0; s2=0;
        for j=1:m
            aj = 1/(prod(x(j)-x([1:j-1,j+1:m])));
            s1 = s1 + (y(j)*aj)/(vx-x(j));
            s2 = s2 + aj/(vx-x(j));
        end
        vy = s1/s2;
        
    end
    y1(k) = vy
end

end

