%Simularea unui joc de carti

rand('state',sum(100*clock));
for k=1:20
   n=ceil(13*rand);
   fprintf('Cartea extrasa: %3.0f\n',n)
   disp('  ')
   disp('Apasati r si Return pentru a continua')
   r=input('sau orice litera pentru a termina: ','s');
   if r~='r', break, end
end