x0 = [-1 4];
nIt = 50;
epsilon = 10 ^ -4;
[X, final] = newton('sistem', 'jacobian', epsilon, x0, nIt);
if final == nIt
     fprintf('Eroare gasire solutie! S-au executat toate iteratiile.\n');
else
     fprintf('Solutia gasita este: \n');
     fprintf('%+5.3f\n', X);
     fprintf('Au fost executate %d iteratii\n', final);
end
