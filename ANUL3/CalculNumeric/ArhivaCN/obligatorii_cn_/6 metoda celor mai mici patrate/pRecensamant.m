clf;
t= 1900:10:2010;
y=[75.995, 91.972, 105.710, 123.200, 131.670, 150.700, 179.320, 203.210, 226.510, 249.630, 281.420, 308.790];
%plot(t,y,'o');

t=t';
y=y';

n=length(t);
%{
A=[t.^3, t.^2, t, ones(size(t))];
c=A\y;         % sau   c=mcmmpd(t,y,3);
%}

% medie

mu=mean(t); s=std(t);
tn=(t-mu)/s;
A=[tn.^3, tn.^2, tn, ones(n,1)];
c=A\y

tg=1895:2025;
tgn=(tg-mu)/s;
yg=polyval(c,tgn);

plot(t,y,'o', tg, yg); hold on

w=[1975,2021];
wn=(w-mu)/s;
pe=polyval(c,wn);
plot(w,pe,'g*');

