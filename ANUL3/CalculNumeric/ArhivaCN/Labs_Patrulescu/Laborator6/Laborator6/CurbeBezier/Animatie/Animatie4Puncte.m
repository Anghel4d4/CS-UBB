
clc
close all
clear all
hold on
h=0.01;

t=0:h:1;
Bx=[1,2,4,5]; % puncte de control
By=[2,3,1,-1]; % puncte de control
n=length(Bx)-1;

 

 axis([min(Bx)-0.5 max(Bx)+0.5 min(By)-0.5 max(By)+0.5 ])




plot(Bx,By,'k*')
plot(Bx,By,'b')

text(Bx(1),By(1),'P_0')
text(Bx(2),By(2),'P_1')
text(Bx(3),By(3),'P_2')
text(Bx(4),By(4),'P_3')

Lung=length(t);%numarul de elemente intre 0 si 1
Px=zeros(1,Lung);%abscisele de pe curba
Py=zeros(1,Lung);%ordonatele de pe curba

q=zeros(1,n-1);
x=zeros(n-1,Lung);%Prima linie: abscisele de pe dreapta P0P1, A doua linie:  de pe  P1P2, A treia linie: de pe P2P3
y=zeros(n-1,Lung);%Prima linie: ordoatele de pe dreapta P0P1, A doua linie:  de pe  P1P2, A treia linie: de pe P2P3

q1=zeros(1,n-2);
x1=zeros(n-2,Lung);%abscisele de pe dreapta magenta
y1=zeros(n-2,Lung);%ordonatele de pe ddreapta magenta

l=zeros(1,n-2);
l1=zeros(1,n-3);
for k=1:Lung
        for i=1:n+1
         Px(k)=Px(k)+Bx(i)*Bernstein_ni(t(k),n,i);
         Py(k)=Py(k)+By(i)*Bernstein_ni(t(k),n,i);
      if i<n+1
         [x(i,k),y(i,k)]=EcDreptei([Bx(i),Bx(i+1)],[By(i),By(i+1)],t(k)); 
          q(i)=plot(x(i,k),y(i,k),'r*');%q(1)-deseneaza punctele de pe P0P1, q(2)- de pe P1P2 , q(3)- de pe P2P3

      end
        end
     for i=1:n-1
        [x1(i,k),y1(i,k)]=EcDreptei([x(i,k),x(i+1,k)],[y(i,k),y(i+1,k)],t(k)); 
        q1(i)=plot(x1(i,k),y1(i,k),'ro');
        l(i)=line([x(i,k),x(i+1,k)],[y(i,k),y(i+1,k)],'color','g'); 
     end
     
        for i=1:n-2
        l1(i)=line([x1(i,k),x1(i+1,k)],[y1(i,k),y1(i+1,k)],'color','m'); 
        end
     
        plot(Px(k),Py(k),'b.')
        pause(0.03)
        F(k) = getframe;
       delete(q(:))
       delete(l(:))
       delete(q1(:))
       delete(l1(:))
end


