function s = cosTaylor2(x)
s = 0;
t = 1;
n = 1;
while (s+t ~= s)
    s = s+t;
    t = -x^(2*n+1) / (2*n+1)*t;
    n = n +2;
end
end