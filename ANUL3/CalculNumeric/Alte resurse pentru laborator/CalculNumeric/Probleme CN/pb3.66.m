t = 1:25;
y = [ 5.0291 6.5099 5.3666 4.1272 4.2948...
6.1261 12.5140 10.0502 9.1614 7.5677...
7.2920 10.0357 11.0708 13.4045 12.8415...
11.9666 11.0765 11.7774 14.5701 17.0440...
17.0398 15.9069 15.4850 15.5112 17.6572];

%(a)
a=polyfit(t,y,1);
tt=0:0.01:25;
yy=a(1)*tt+a(2);
plot(t,y,'*r')
hold on
plot(tt,yy)
title('Aproximarea cu o dreapta a datelor.')
yt=a(1)*t+a(2);
rez=yt-y;
figure(2)
plot(t,rez,'*g')
title('Reziduurile')
%Se observa de pe figura ca pt t=7 avem o valoare ilegala
outlier=[7, y(7)];
%(b)
t=[1:6,8:25];
y=[y(1:6),y(8:25)];
a=polyfit(t,y,1);
tt=0:0.01:25;
yy=a(1)*tt+a(2);
plot(t,y,'*r')
hold on
plot(tt,yy)
title('Aproximarea cu o dreapta a datelor fara outlierul.')
yt=a(1)*t+a(2);
rez=yt-y;
figure(3)
plot(t,rez,'*g')
title('Reziduurile fara outlier')
%Reziduurile oscileaza intre -2.5 si 2.5 ca un sinusoid, descresc, cresc,
%apoi iarasi descresc...

%(c)
n=length(t);
A=[ones(n,1),t',sin(t')];
B=A\y';
x=linspace(0,26,1000);
approx=B(1)*ones(size(x))+B(2)*x+B(3)*sin(x);
figure(4)
plot(t,y,'o',x,approx,'-',outlier(1),outlier(2),'*')
legend('punctele','Modelul','Outlier-ul')
title('Modelul y(t)=B(1)+B(2)*t+B(3)*sin(t), cu outlierul exclus')