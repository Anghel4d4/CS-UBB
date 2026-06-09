function E = recdir(n,k)
    E = 0;
    for j=n+k:-1:n+1
        E = (1-E)/j;
    end
end
%{
function E = recdir(n)
    E = exp(-1);
    for k=2:n
        E = 1-k*E;
    end
end
%}