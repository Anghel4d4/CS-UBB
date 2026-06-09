function i3 = intAdapt2(f,a,b,err)
c = (a+b)/2;
fa = f(a);
fb = f(b);
fc = f(c);
i3 = quadstep(f,a,b,err,fa,fb,fc);
function q=quadstep(f,a,b,err,fa,fb,fc)
h = b-a;
c = (a+b)/2;
fd = f((a+c)/2);
fe = f((c+b)/2);
q1 = (h/6)*(fa+4*fc+fb);
q2 = (h/12)*(fa+4*fd+2*fc+4*fe+fb);
if abs(q1-q2)<err
    q = q2 + (q2-q1)/15;
else
    qa=quadstep(f,a,c,err,fa,fd,fc);
    qb=quadstep(f,c,b,err,fc,fe,fb);
    q=qa+qb;
end