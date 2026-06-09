function x=Cebisev(a,b,nc)
x=0.5*(a+b)+0.5*(b-a)*cos((2*(1:nc)-1)/(2*nc)*pi);