clc
f = @(x)sin(x);
%IR = intRomberg(f, 0, pi/10, 10);
IA = simp(f,0,pi/2,10);
%IA2 = simp(f,0,pi/10,10);
%fprintf('IR=%g\n', IR);
%fprintf('IA=%g\n', IA);
fprintf('IA=%g\n', IA);