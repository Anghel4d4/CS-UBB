function vl=mybeta(z,w)

vl=adaptquad(@(t)f(z,w,t),0,1,1e-6,@Simpson);


function f=f(z,w,t)
f=t.^(z-1).*(1-t).^(w-1);
