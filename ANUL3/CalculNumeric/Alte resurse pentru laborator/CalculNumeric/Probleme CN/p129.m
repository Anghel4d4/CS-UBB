clc
%(b)
disp('b.');
format long
y=zeros(1,20);
y(1)=1-exp(-1);
for i=2:20
    y(i)=i*y(i-1)-exp(-1);
end
%y'
for i=1:20
    str=strcat('y(',num2str(i),')=',num2str(y(i)));
    disp(str);
end
    
%(c)
disp('------------------------');
disp('c.');
Y=zeros(21,5);
k=1;
for i=22:2:30
    yN=0;
    for j=i-1:-1:1
        y=1/j*(yN+exp(-1));
        yN=y;
        if j<21
            Y(j,k)=yN;
        end
    end
    k=k+1;
end

e=zeros(1,4);
for i=1:4
    e(1,i)=max(abs((Y(:,i+1)-Y(:,i))./Y(:,i+1)));
end
%e'
for i=1:4
    str=strcat('e(',num2str(i),')=',num2str(e(i)));
    disp(str);
end
%Y(:,5)