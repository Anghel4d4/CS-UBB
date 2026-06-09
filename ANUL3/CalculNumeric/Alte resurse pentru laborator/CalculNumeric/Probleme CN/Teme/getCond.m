function f = getCond(n,H,Hinv)          
for i=1:n
    for j=1:n
        for k=1:n
            if not(k==i || k==j)
                Hinv(i,j) = (i+j-1) * prod((i+k-1)/(j-k)) * prod((j+k-1)/(i-k));
            end
        end
    end
end
cond1 = max(eig(H)) * max(eig(Hinv));
f = cond1;
