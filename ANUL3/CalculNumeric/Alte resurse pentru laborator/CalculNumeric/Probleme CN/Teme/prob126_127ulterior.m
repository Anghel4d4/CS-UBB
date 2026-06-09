clc

n1 = 10;
H1 = hilb(n1);
Hinv1 = zeros(n1);

n2 = 20;
H2 = hilb(n2);
Hinv2 = zeros(n2);

n3 = 40;
H3 = hilb(n3);
Hinv3 = zeros(n3);

f = getCond(n1,H1,Hinv1);
disp(f)

f = getCond(n2,H2,Hinv2);
disp(f)

f = getCond(n3,H3,Hinv3);
disp(f)

