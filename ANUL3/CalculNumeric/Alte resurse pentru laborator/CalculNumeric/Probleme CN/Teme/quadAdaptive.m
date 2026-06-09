function quadAd = quadAdaptive(met,f,a,b,err)
m = 4;
if (abs(met(f,a,b,m)-met(f,a,b,2*m))<err)
    quadAd = met(f,a,b,2*m);
else
    quadAd = quadAdaptive(met, f, a,(a+b)/2, err) + quadAdaptive(met,f,(a+b)/2, b, err);
end