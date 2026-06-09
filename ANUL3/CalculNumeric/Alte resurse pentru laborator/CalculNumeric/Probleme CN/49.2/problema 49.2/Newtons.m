function [rez,iteratii,x]=Newtons(p0,epsilon,N0,f,fderivat)

i=1;
x=[p0];
while (i<=N0)
   p=p0-feval(f,p0)/feval(fderivat,p0);
   x=[x p];
   if (abs(p-p0)<epsilon)
      rez=p;
      iteratii=i;
      return
   end
   i=i+1;
   p0=p;
end
iteratii=N0;
rez=0;
