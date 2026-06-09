function r = rungeCorectat(n)

s = 1:n;

for i=1:n
   s(i) = cos(3.14*i./n); 
end 
x=-1:0.01:1;
plot(x,f(x));

p = f(s);
hold on
plot(x,v(s,p,x));

end