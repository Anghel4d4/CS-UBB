a=[3 7 1;7 1 1; 9 3 21];
index= abs(inversaLUP(a)-inv(a));
if(index>tolerance)
    disp('Test fail')
end

a=[3.54 1 1;711 8 3; 9 31 21.442];
index= abs(inversaLUP(a)-inv(a));
if(index>tolerance)
    disp('Test fail')
end

a=[3.23 555 1;7 1.9 3; 32 3 211];
index= abs(inversaLUP(a)-inv(a));
if(index>tolerance)
    disp('Test fail')
end

a=[23 55 17;435 8.91 21; 2 63 11];
index= abs(inversaLUP(a)-inv(a));
if(index>tolerance)
    disp('Test fail')
end