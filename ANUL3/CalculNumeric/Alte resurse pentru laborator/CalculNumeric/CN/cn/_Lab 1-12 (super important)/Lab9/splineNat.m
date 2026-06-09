function yi=splineNat(x, y, xi)
a=sistem1(x,y)';
yi=zeros(1, length(xi));
for i=1:length(xi)
    kf=find(xi(i)<=x);
    disp(xi(i)<=x)
    if ~isempty(kf)
        k = kf(1)-1;
        if(k>0)
            yi(i)=polyval(a(4*k-3:4*k),xi(i));
        elseif xi(i)<=x(1)
            yi(i)=y(1);
        end
    end
end
