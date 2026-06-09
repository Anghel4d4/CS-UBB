clc
clearvars
format long

% general init
dom_start = 0;
dom_end = 1;
x = [dom_start:.05:dom_end];
n = 101;
f1 = @(x) (x^4);
f2 = @(x) (x^5);

myFunc = init;

% metoda trapezelor function 1
y1 = arrayfun(f1, x);
z11 = myFunc.trapeze(f1, dom_start, dom_end, n)
s11 = myFunc.simpson(f1, dom_start, dom_end, n)

% metoda trapezelor function 2
y2 = arrayfun(f2, x);
z21 = myFunc.trapeze(f2, dom_start, dom_end, n)
s21 = myFunc.simpson(f2, dom_start, dom_end, n)

% valoarea la C se poate aproxima prin cresterea nr de puncte afisate
% valorile comentate reprezinta un interval destul de exact
% pentru intervalul de mai jos C = 1.249987500000000 reprezinta o valoare
% pentru care regula trapezului returneaza valori mai bune decat regula
% lui Simpson
% inceput =  1.249987
% sfarsit = 1.249988
% c = inceput:.000000001:sfarsit;

% pentru valorile specificate in cerinta regula trapezelor nu aduce
% rezultate mai bune comparativ cu regula lui Simpson
inceput =  15/14
sfarsit = 85/74
c = inceput:.00001:sfarsit;
errTrapeze = zeros(1, length(c));
errSimpson = zeros(1, length(c));

func = @(c) (1 / 6 - c / 5);
func3 = @(c) (@(x) (x.^5 - c * x.^4));
minTrapeze = [inf, inf];
minSimpson = [inf, inf];
for i = 1:length(c)
    func4 = @(x) (x.^5 - c(i) * x.^4);
    errTrapeze(i) = abs(func(c(i)) - myFunc.trapeze(func3(c(i)), 0, 1, n));
    errSimpson(i) = abs(func(c(i)) - myFunc.simpson(func3(c(i)), 0, 1, n));
    if minTrapeze(1) > errTrapeze(i)
       minTrapeze = [errTrapeze(i), c(i)];
    end
    if minSimpson(1) > errSimpson(i)
       minSimpson = [errSimpson(i), c(i)];
    end
end

plot(c, errTrapeze, '-r', c, errSimpson, '--b')
legend('trapeze', 'simpson', 1)
minTrapeze
minSimpson