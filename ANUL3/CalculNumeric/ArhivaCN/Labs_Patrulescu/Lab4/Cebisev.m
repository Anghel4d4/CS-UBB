function x=Cebisev(a,b,n)
    x=0.5*(a+b)+0.5*(b-a)*cos((2*(1:n)-1)*pi/2*n)