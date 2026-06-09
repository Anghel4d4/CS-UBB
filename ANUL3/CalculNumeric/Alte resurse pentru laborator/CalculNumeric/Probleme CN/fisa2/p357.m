clc
f = @(x) asin(x);

a = -1 / sqrt(2);
b = 1 / sqrt(2);

grad = 15;
[c, x, y] = cheby(f, grad, a, b);

t = a:.01:b;
plot(t, f(t), 'b', t, chebpolval(c, t, a, b), 'r' , x, f(x), 'ok')

for t = a:.01:b
    fprintf('eroare in punctul %f: %e\n', t, f(t) - chebpolval(c, t, a, b))
    fprintf('eroare in punctul %f: %e\n', t, f(t) - arcsin(t, c))  
end

for t = -1:.01:a
    fprintf('eroare functie in punctul %f: %e\n', t, f(t) - arcsin(t, c))  
end

for t = b:.01:1
    fprintf('eroare functie in punctul %f: %e\n', t, f(t) - arcsin(t, c))  
end