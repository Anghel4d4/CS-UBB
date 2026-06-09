%
n = input('n=');
p = input('p=');

% calculam limita pentru xn
% radacinile ecuatiei x = phi(x) <=> x = sqrt(p + x) <=> x^2 - x - p = 0;
rad = roots([1, -1, -p]);

% sirul xn fiind crescator, cu elemente pozitive, limita va fi radacina pozitiva
if(rad[0] < 0)
  alfa = rad[1];
else
  alfa = rad[0];
end;
fprintf("Limita sirului xn = %.4f\n", alfa);


% calculam limita pentru yn
% radacinile ecuatiei x = phi(x) <=> x = 1/(p + x) <=> x^2 + px - 1 = 0;
rad = roots([1, p, -1]);

% sirul yn fiind descrescator, cu elemente pozitive, limita va fi radacina pozitiva
if(rad[0] < 0)
  alfa = rad[1];
else
  alfa = rad[0];
end;
fprintf("Limita sirului yn = %.4f\n", alfa);
