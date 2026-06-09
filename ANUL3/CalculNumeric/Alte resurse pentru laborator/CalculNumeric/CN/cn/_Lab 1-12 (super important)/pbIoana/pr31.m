i=1;
while exp(i)<=realmax
    i=i+1;
end
fprintf('Cea mai mare valoare pentru care exp nu da depasire:%d\n',i-1)
fprintf('exp(%d)=%g\n',i-1,exp(i-1))
fprintf('exp(%d)=%g\n',i,exp(i))

i=-1;
while exp(i)>0
    i=i-1;
end
fprintf('Cea mai mica valoare pentru care exp nu da depasire:%d\n',i+1)
fprintf('exp(%d)=%g\n',i+1,exp(i+1))
fprintf('exp(%d)=%g\n',i,exp(i))

