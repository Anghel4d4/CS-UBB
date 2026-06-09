function [n,erref]=excebc(f,err,proc)
%f - functia
%err - eroarea
%proc - procedeul de aproximare (Legendre, Cebisev
%       continuu, Cebisev discret)
x=linspace(-1,1,100); %abscisele
y=f(x); %valorile functiei
n=1;
while 1
    ycc=proc(f,x,n);  %valorile aproximantei
    erref=norm(y-ycc,inf);  %eroarea
    if norm(y-ycc,inf)<err  %succes
        return
    end
    n=n+1;
end