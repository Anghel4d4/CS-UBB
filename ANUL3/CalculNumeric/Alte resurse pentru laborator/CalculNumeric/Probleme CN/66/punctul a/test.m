z0 = -1 + 4i;
nIt = 170;
epsilon = 10 ^ -5;

[Z, final] = newton_raphson('fct', 'fd', epsilon, z0, nIt );

if final == nIt
     fprintf('S-au executat toate cele 170 de iteratii. Solutia nu s-a gasit\n');
else
     fprintf('Solutia este: ');
     fprintf('%+5.2f %+5.2fi\n', real(Z), imag(Z));
     fprintf('Au fost executate %d iteratii !!\n', final);
end
%clear