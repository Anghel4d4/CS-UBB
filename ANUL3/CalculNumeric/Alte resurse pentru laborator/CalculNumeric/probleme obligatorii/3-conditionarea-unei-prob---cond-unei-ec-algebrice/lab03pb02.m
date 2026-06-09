%conditionarea Hilbert
clc;
fprintf('Conditionarea matricei Hilbert\n');
for n = 10:15
    fprintf('cond(hilb(%d))=%g\n', n, cond(hilb(n)));
end;

%for n = 10:15
 %   fprintf('cond(hilbert(%d))=%g\n', n, cond(hilbert(n)));
%end;

