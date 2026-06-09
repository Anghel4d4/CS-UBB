function y=evalCebisev(c,x)
%EVALCEBISEV - evaluare aproximanta Cebisev mcmmp

y=c(1)/2*ones(size(x));
for k=1:length(c)-1
    y=y+c(k+1)*vCebisev(x,k);
end