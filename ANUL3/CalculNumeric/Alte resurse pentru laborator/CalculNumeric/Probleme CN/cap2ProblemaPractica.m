%problema 2.38
clc
alfa = 1/sqrt(2);
A = zeros(21, 21);
B = zeros(21, 1);

%ecuatii
%jonc 2
%1: f2 = f6
A(1,2) = 1;
A(1,6) = -1;
%2: f3  =10
A(2,3) = 1;
B(2) = 10;

%jonc 3
%3: alfa*f1 = f4 + alfa*f5
A(3,1) = alfa;
A(3,4) = -1;
A(3,5) = -1*alfa;
%4: alfa*f1 + f3 + alfa*f5 = 0
A(4,1) = alfa;
A(4,3) = 1;
A(4,5) = alfa;

%jonc 4
%5: f4 = f8
A(5,4) = 1;
A(5,8) = -1;
%6: f7 = 0
A(6,7) = 1;

%jonc 5
%7: alfa*f5 + f6 = alfa*f9 + f10
A(7,5) = alfa;
A(7,6) = 1;
A(7,9) = -1*alfa;
A(7,10) = -1;
%8: alfa*f5 + f7 + alfa*f9 = 15
A(8,5) = alfa;
A(8,7) = 1;
A(8,9) = alfa;
B(8) = 15;

%jonc 6
%9: f10 = f14
A(9,10) = 1;
A(9,14) = -1;
%10: f11 = 20
A(10,11) = 1;
B(10) = 20;

%jonc 7
%11: f8 + alfa*f9 = f12 + alfa*f13
A(11, 8) = 1;
A(11, 9) = alfa;
A(11, 12) = -1;
A(11,13) = -1*alfa;
%12: alfa*f9 + f11 + alfa*f13 = 0
A(12, 9) = alfa;
A(12,11) = 1;
A(12,13) = alfa;

%jonc 8
%13: f12 = f16
A(13, 12) = 1;
A(13, 16) = -1;
%14: f15 = 0
A(14, 15) = 1;

%jonc 9
%15: alfa*f13 + f14 = alfa*f17 + f18
A(15,13) = alfa;
A(15,14) = 1;
A(15,17) = -1*alfa;
A(15,18) = -1;
%16: alfa*f13 + f15 + alfa*f17 = 25
A(16,13) = alfa;
A(16,15) = 1;
A(16,17) = alfa;
B(16) = 25;

%jonc 10
%17: f18 = f21
A(17, 18) = 1;
A(17, 21) = -1;
%18: f19 = 30
A(18,19) = 1;
B(18) = 30;

%jonc 11
%19: f16 + alfa*f17 = f20
A(19,16) = 1;
A(19,17) = alfa;
A(19,20) = -1;
%20: alfa*f17 + f19 + alfa*f20 = 0
A(20,17) = alfa;
A(20,19) = 1;
A(20,20) = alfa;

%jonc 12
%21: alfa*f20 + f21 = 0
A(21,20) = alfa;
A(21,21) = 1;

f = A\B;

fprintf('Fortele membre rezultate sunt urmatoarele:\n');
for index = 1:length(f)
    fprintf('forta %2.0f = %2.5f\n',index,f(index));
end

