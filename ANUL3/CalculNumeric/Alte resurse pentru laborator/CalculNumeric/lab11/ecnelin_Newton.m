function [z,ni] = ecnelin_Newton(f,fd,x0,ea,er,nrMax)
    if nargin < 6
        nrMax = 50; 
    end
    if nargin < 5 
        er = 0; 
    end
    if nargin < 4 
        ea = 1e-4; 
    end
    for k=1:nrMax
        xn=x0-fd(x0)\f(x0);
        if norm(xn-x0)<ea+er*norm(xn) %succes
            z=xn;
            ni=k;
            return
        end
        x0=xn;
    end
    error('S-a depasit numarul maxim de iteratii');