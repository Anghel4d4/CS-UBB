macheps = 1;
while (1 + macheps/2) ~= 1.0
    macheps = macheps/2;
end

tolerance=10000*macheps;

gresit=0;

for i=0:100   
    nr1=1000*rand(1,1);
    nr2=1000*rand(1,1);
    if(abs(logaritmNaturalTema(nr1*nr2)-(logaritmNaturalTema(nr1)+logaritmNaturalTema(nr2)))>tolerance) 
        gresit=1;
    end
       
    
    x=10*rand(1,1);
    y=exp(x);
    if(abs(logaritmNaturalTema(y)-x)>tolerance) 
        gresit=1;
    end
end

if(gresit==1)
    disp('Test fail')
end

   

  


