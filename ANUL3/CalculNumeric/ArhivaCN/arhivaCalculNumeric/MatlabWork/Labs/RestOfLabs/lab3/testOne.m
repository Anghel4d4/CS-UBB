function testOne(n)
hold on
for i=1:100
    p=poly(1:n);
    %q=p+rand(1,n+1)*1e-03;
    q=p+normrnd(0,0.01,1,n+1);
    t=roots(q)
    plot(t, '*')
end
plot(1:n, zeros(1,n), '*b')