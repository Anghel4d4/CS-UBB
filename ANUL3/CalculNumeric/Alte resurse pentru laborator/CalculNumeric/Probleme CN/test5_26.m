clc;
w_0=@(k)((2*k)/(log((1+k)/(1-k))))
w1=@(k)((2*k)/(log((1+k)/(1-k))))-0.25;
w2=@(k)((2*k)/(log((1+k)/(1-k))))-0.5;
w3=@(k)((2*k)/(log((1+k)/(1-k))))-0.75;

%pt w_0 = 0.25 radacina k nu mai apartine intervalului (0,1)
%astfel am ales 0.2725 
w4=@(k)((2*k)/(log((1+k)/(1-k))))-0.2725;

%derivata lui w_0
wd=@(k)(2*(k.^2-1)*log((k+1)/(1-k))+4*k)/((k.^2-1)*(log((k+1)/(1-k))).^2);

%sol pt ec neliniara sunt simetrice fata de origine
fplot(w_0,[-1,1])

Xs1_pos=NewtonRoot(w1,wd,0.99,1e-3,50)
Xs2_pos=NewtonRoot(w2,wd,0.99,1e-3,50)
Xs3_pos=NewtonRoot(w3,wd,0.99,1e-3,50)
Xs3_pos=NewtonRoot(w4,wd,0.99,1e-3,50)

Xs1_neg=NewtonRoot(w1,wd,-0.99,1e-3,50)
Xs2_neg=NewtonRoot(w2,wd,-0.99,1e-3,50)
Xs3_neg=NewtonRoot(w3,wd,-0.99,1e-3,50)
Xs4_neg=NewtonRoot(w4,wd,-0.99,1e-3,50)



