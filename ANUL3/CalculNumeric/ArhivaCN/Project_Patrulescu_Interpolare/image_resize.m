data1 = imread('tada.png');
numcr = 512; numrr = 512 ; %dimensiunile dorite

double(data1(1,1,1))
%part1
[m,n,p] = size(data1);
% p = (r,g,b) :D
% interpolation along column
iwant1 = zeros(m,numcr,p);
xi = linspace(1,n,numcr); % genereaza numcr valori echidistante intre 1 si n 
for i = 1:m
    for j = 1:p
        T = interp1(1:n,double(data1(i,:,j)),xi); %default interpolare liniara
        iwant1(i,:,j) = T;        
    end
end

%part2
[m,n,p] = size(iwant1);
% interpolation along row
iwant2 = zeros(numrr,numcr,p) ;
yi = linspace(1,m,numrr); % genereaza numrr valori echidistante intre 1 si m 
for i = 1:n
    for j = 1:p
        T = interp1(1:m,double(iwant1(:,i,j)),yi); %default interpolare liniara
        iwant2(:,i,j) = T;        
    end
end
iwant2 = uint8(iwant2);
imshow(iwant2);