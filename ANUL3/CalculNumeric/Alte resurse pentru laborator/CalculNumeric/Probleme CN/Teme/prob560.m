clc;
Q = 1.2; % m^3/s - rata de curgere a volumului
g = 9.81; % m/s^2 - acc. gravitationala
b = 1.8; % m - latime canal
H = 0.075; % m - inaltimea cocoasei
h0 = 0.6; % m - nivelul superior al apei
f = @(h) ((Q.^2)./(2.*g.*b.^2.*h.^2 + h)) + h;
fdev = @(h) 1-(((4.*b.^2.*g.*h+1).*Q.^2)./((2.*b.^2.*g.*h.^2 + h).^2));
[h,nIt] = metNewton(f,fdev,h0,1e-6,H,100);
% afisam valoarea lui h
disp(abs(h))