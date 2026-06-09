function f = util
	% propria implementare a functie polyfit
	% x - abscise
	% y - ordonate
	% n - ordinul polinomului
	% m - numarul de puncte
    f.getMetodaCelorMaiMiciPatrate = @getMetodaCelorMaiMiciPatrate;
end

function M = getMatrix(x, n, m)
    M = zeros(n, n);
    for i=1:n
        for j=1:n
            temp = x .^ (i + j - 2);
            M(i,j) = sum(temp);
        end
    end
end

function R = getResultMatrix(x, y, n, m)
    R = zeros(n, 1);
    for i=1:n
        temp = (x .^ (i - 1)) .* y;
        R(i, 1) = sum(temp);
    end
end

function MCMMP = getMetodaCelorMaiMiciPatrate(x, y, n, m)
    MCMMP = getMatrix(x, n, m) \ getResultMatrix(x, y, n, m);
    MCMMP = fliplr(MCMMP');
end