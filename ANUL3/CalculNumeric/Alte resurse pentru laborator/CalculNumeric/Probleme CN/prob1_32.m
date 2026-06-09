% Problema 1.32. Care este cea mai mare valoare pentru care exponentiala din
% MATLAB exp nu da depasire? Care este cea mai mica valoare pentru care 
% exponentiala din MATLAB exp da depasire?

%exp(xmax)=realmax=> xmax=log(realmax)

clc
xmax=log(realmax);
exp(xmax);
fprintf('Cea mai mare valoare pentru care exp nu da depasire este: log(realmax)=%d\n',xmax)
fprintf('exp(log(realmax))=%g\n\n',exp(xmax))

xmin=xmax+eps(xmax);
fprintf('Cea mai mica valoare pentru care exp da depasire este: log(realmax)+eps(log(realmax))=%d\n',xmin)
fprintf('exp(log(realmax)+eps(log(realmax)))=%g\n',exp(xmin))