N = 20;
e = zeros (2, N);
err = zeros (2, N);

for n = 1:N
	e (1, n) = calcLimitaEuler(n);
	e  (2, n)  = calcSumaEuler(n);
end

err( : , : ) = abs (exp(1) - e ( : , : ))./exp(1);

semilogy(1:N, err(1,:), '-.k', 1:N, err(2,:), '-.b');

legend('calcLimitaEuler(n)', 'calcSumaEuler(n)', 'Location', 'SouthWest');
xlabel ('n');
ylabel('erori relative');
title('Erori Relative');
saveas(gcf ,'errors_rel','fig');
saveas(gcf ,'errors_rel','epsc');
