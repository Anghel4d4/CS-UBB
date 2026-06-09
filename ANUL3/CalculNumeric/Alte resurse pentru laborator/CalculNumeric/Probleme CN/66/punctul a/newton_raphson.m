function [ Z, final ] = newton_raphson( f, fd, epsilon, z0, nIteratii )
%NEWTON_RAPHSON Summary of this function goes here
%  Detailed explanation goes here

iIteratie = 0;
final = 0;
Z = 0 + 0i;
while ( iIteratie < nIteratii)
    z1 = z0 - ( feval(f, z0) * inv( (feval(fd, z0)) ) );
    rez = abs(z1 - z0);
    if abs( z1 - z0 ) < epsilon
        Z = z1;
        final = iIteratie;
        return
    end
    iIteratie = iIteratie + 1;
    z0 = z1;
end
final = nIteratii;