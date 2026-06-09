clc
clear
disp('Toate solutiile sunt:');
ToateSolutiile = fsolve(@myfun,[1 -1 3],optimset('Display','iter'))
Lungime = length(ToateSolutiile);
disp('Lungimea vectorului rezultat este: ');
Lungime
disp('Cele mai mici 3 radacini pozitive sunt: ');
for i=1:Lungime 
    if ToateSolutiile(i)>=0
        x = ToateSolutiile(i);
        x
        %else 
        %disp('Solutia este negativa');
    end
end
