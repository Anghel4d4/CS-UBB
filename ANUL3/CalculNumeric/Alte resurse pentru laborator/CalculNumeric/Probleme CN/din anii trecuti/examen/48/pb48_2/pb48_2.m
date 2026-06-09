A = [1, 1, 1; 1, 1, 1; 1, 1, 1; 1, 1, 1];

b = [1, 2, 2, 1]';

fprintf('%d*x1*sin(t) + %d*x2 + %d*x3*cos(t)  = %d\n',A(1,1),A(1,2),A(1,3),b(1));
fprintf('%d*x1 + %d*x2*cos(t) + %d*x3  = %d\n',A(2,1),A(2,2),A(2,3),b(2));
fprintf('%d*x1*cos(t) + %d*x2 + %d*x3*sin(t) = %d\n',A(3,1),A(3,2),A(3,3),b(3));
fprintf('%d*x1 + %d*x2*sin(t) + %d*x3  = %d\n',A(4,1),A(4,2),A(4,3),b(4));

x0 = [1,1,0,0]';
[x1, ni1] = Newton('a','b',x0(:,1),1e-6,0,200);

fprintf('Solutiile sunt:\n');
format long

fprintf('x1 = %d\n',x1(1));
fprintf('x2 = %d\n',x1(2));
fprintf('x3 = %d\n',x1(3));
fprintf('t = %d\n',x1(4));


