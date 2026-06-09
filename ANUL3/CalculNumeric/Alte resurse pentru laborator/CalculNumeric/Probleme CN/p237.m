a=sqrt(2)/2;
c=sqrt(3)/2;
A=[-1 0 0 a 1 0 0 0
    0 0 0 -a 0 0 c 0
    0 0 0 0 -1 0 0 1
    0 0 0 0 0 0 -c -1
    0 -1 0 a 0 0 0 0
    0 0 0 -a 0 -1 -1/2 0
    0 0 0 0 0 1 0 0
    0 0 -1 0 0 0 1/2 0 
    ];

b=zeros(8,1);
b(7)=10000;
xc=A\b;

%Asa nu pot aplica metoda Sor(nu da solutia corecta),si deci reorganizez sistemul,
%adica schimb ordinea liniilor ca sa am pe diagonala
%elemente nenule, asa ajung la matricea Anew
Anew=[A(1,:)
    A(5,:)
    A(8,:)
    A(6,:)
    A(3,:)
    A(7,:)
    A(2,:)
    A(4,:)];
b=zeros(8,1);
b(6)=10000;
x0=ones(8,1);
%factorul de realxare:
omega=1.1;
[x,i] = sor(Anew,b,x0,1e-5,omega);
fprintf('Solutia exacta:\n')
fprintf('F_1=%4.2f\nF_2=%4.2f\nF_3=%4.2f\nf_1=%4.2f\nf_2=%4.2f\nf_3=%4.2f\nf_4=%4.2f\nf_5=%4.2f\n',xc)
fprintf('\nSolutia cu metoda SOR,pentru omega=%1.2f:\n',omega)
fprintf('F_1=%4.2f\nF_2=%4.2f\nF_3=%4.2f\nf_1=%4.2f\nf_2=%4.2f\nf_3=%4.2f\nf_4=%4.2f\nf_5=%4.2f\n',x)
fprintf('\nNr de iteratii in metoda SOR: %d \n',i)
